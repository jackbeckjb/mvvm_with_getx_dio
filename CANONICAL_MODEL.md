# Canonical Model in Flutter (with Examples)

## TL;DR (Quick Summary)

If your Flutter app **directly uses backend JSON models**, any backend change (field rename, nesting, optional fields) can **break your app**.
A **Canonical Model** solves this by introducing a **stable domain model** that your UI and business logic rely on, while backend-specific models (DTOs) and mappers absorb all API changes.

## 🔥 TL;DR (High-level summary)

* Domain (Canonical Model) → what your app believes a User is

* DTOs → backend-specific shapes (can change anytime)

* Mappers → convert DTO ➜ Domain

* UI & business logic ONLY talk to Domain models

* Backend changes? 👉 update DTO + Mapper only

---

## 1. What happens if you DON’T use a canonical model?

When you don’t use a canonical model:

* UI depends on backend JSON shape
* Every backend change forces UI + model changes
* Logic leaks into API models
* Refactors become risky

### Example (No Canonical Model)

#### Backend response (initial)

```json
{
  "id": 1,
  "first_name": "John",
  "last_name": "Doe",
  "wallet_amount": 1500
}
```

#### Flutter model (used everywhere)

```dart
@JsonSerializable()
class User {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'wallet_amount')
  final double walletAmount;
}
```

Now backend changes 👇

#### Backend response (changed)

```json
{
  "user": {
    "id": 1,
    "name": {
      "first": "John",
      "last": "Doe"
    },
    "wallet": {
      "amount": 1500
    }
  }
}
```

❌ Result:

* `User.fromJson()` breaks
* UI crashes
* Business logic breaks
* You must rewrite models and fix usage everywhere

This is **tight coupling**.

---

## 2. What is a Canonical Model?

A **Canonical Model** is:

* A **pure domain model**
* Stable and backend-independent
* Used ONLY by UI & business logic

> Backend JSON is NEVER used directly by UI.

### Canonical User Model

```dart
class User {
  final int id;
  final String firstName;
  final String lastName;
  final double walletAmount;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.walletAmount,
  });

  bool get isPremiumUser => walletAmount > 1000;
  String get displayName => '$firstName $lastName';
}
```

✅ This model never changes even if backend changes 10 times.

---

## 3. What are DTOs (Data Transfer Objects)?

DTOs:

* Represent **exact backend JSON shape**
* Used only for serialization/deserialization
* Can change freely with backend

### Flat DTO

```dart
part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'wallet_amount', defaultValue: 0)
  final double walletAmount;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDto(json);
}
```

---

## 4. What is a Mapper?

A **Mapper** converts DTO → Canonical Model

```dart
extension UserDtoMapper on UserDto {
  User toDomain() {
    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      walletAmount: walletAmount,
    );
  }
}
```

✅ Backend logic stays here
✅ UI never touches DTOs

---

## 5. Handling Nested Backend Changes

### DTO – Nested API Shape (NEW BACKEND)
### Nested DTO Example

API:

```json
  {
  "user": {
    "id": 1,
    "name": {
      "first": "John",
      "last": "Doe"
    },
    "wallet": {
      "amount": 1200
    }
  }
}
```

DTOs (Properly Split):

```dart
// data/dto/user_nested_dto.dart
import 'package:json_annotation/json_annotation.dart';

part 'user_nested_dto.g.dart';

@JsonSerializable()
class UserNestedDto {
  final NestedUserDto user;

  UserNestedDto({required this.user});

  factory UserNestedDto.fromJson(Map<String, dynamic> json) =>
      _$UserNestedDtoFromJson(json);
}

@JsonSerializable()
class NestedUserDto {
  final int id;
  final NameDto name;
  final WalletDto wallet;

  NestedUserDto({
    required this.id,
    required this.name,
    required this.wallet,
  });

  factory NestedUserDto.fromJson(Map<String, dynamic> json) =>
      _$NestedUserDtoFromJson(json);
}

@JsonSerializable()
class NameDto {
  final String first;
  final String last;

  NameDto({required this.first, required this.last});

  factory NameDto.fromJson(Map<String, dynamic> json) =>
      _$NameDtoFromJson(json);
}

@JsonSerializable()
class WalletDto {
  @JsonKey(defaultValue: 0.0)
  final double amount;

  WalletDto({required this.amount});

  factory WalletDto.fromJson(Map<String, dynamic> json) =>
      _$WalletDtoFromJson(json);
}

```

✔ DTOs only mirror API
✔ Can change freely
✔ Disposable

### Mapper Layer

```dart
// data/mapper/user_mapper.dart
import '../../domain/user.dart';
import '../dto/user_nested_dto.dart';

class UserMapper {

  static User fromNestedDto(UserNestedDto dto) {
    return User(
      id: dto.user.id,
      firstName: dto.user.name.first,
      lastName: dto.user.name.last,
      walletAmount: dto.user.wallet.amount,
    );
  }
}

```

✔ Single place to adapt backend chaos
✔ Domain stays clean (Canonical Model Never Changed and Ui Never breaks)
✔ Easy to test

---

## 6. Handling Optional / Missing Fields

### Backend sends optional data

last_name Missing:

```json
{
  "id": 1,
  "first_name": "John"
}
```

### DTO handles optionality

```dart
part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  final String? lastName;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDto(json);
}
```
### Mapper

```dart
class UserMapper {
  static User fromFlatDto(UserFlatDto dto) {
    return User(
      id: dto.id,
      firstName: dto.firstName,
      lastName: dto.lastName ?? "",
    );
  }
}
```

Canonical model remains strict and safe.


---

## 7. Repository Example (Supporting Multiple Shapes)

```dart
class UserMapper {

static User fromUserDto(UserDto dto) {
    return User(
      id: dto.id,
      firstName: dto.firstName,
      lastName: dto.lastName,
      walletAmount: dto.walletAmount,
    );
  }

  static User fromNestedDto(UserNestedDto dto) {
    return User(
      id: dto.user.id,
      firstName: dto.user.name.first,
      lastName: dto.user.name.last,
      walletAmount: dto.user.wallet.amount,
    );
  }
}

```

```dart
Future<List<User>> fetchUsers() async {
  final response = await api.get('/users');

  if (response['user'] != null) {
    return [
      UserNestedDto.fromJson(response).toDomain()
    ];
  }

  final List data = response['data'];
  return data
      .map((json) => UserDto.fromJson(json).toDomain())
      .toList();
}
```

✅ Multiple backend versions supported
✅ UI unchanged

---

## 8. Why Business Logic Belongs in Canonical Model


#### Canonical Molde own business logic:

```dart
bool get isPremiumUser => walletAmount > 1000;
String get displayName => '$firstName $lastName';
```

❌ Not in DTO
❌ Not in Mapper
❌ Not in UI


✔ Domain logic stays centralized

---

## 9. Pros & Cons of Canonical Model

### ✅ Pros

* Backend-agnostic UI
* Safer refactors
* Clear architecture
* Handles nested & optional JSON
* Easier testing
* Supports multiple APIs

### ❌ Cons

* More files (DTO + Mapper)
* Initial setup time
* Slight boilerplate

---

## 10. When SHOULD you use a Canonical Model?

✅ Medium to large apps
✅ Long-term projects
✅ Multiple backend teams
✅ Apps with frequent API changes

❌ Very small prototypes
❌ One-off demos

---

## Final Takeaway

> **Canonical Models protect your Flutter app from backend chaos.**

DTOs change.
Mappers adapt.
Your UI stays clean, stable, and predictable.


## EXAMPLE

Here is the diagram of How the Canonical Data Model Works:

![](../assets/canonical-data-model-1.png)

let's understand with real world example

### Scenario: A Shopping Business with Multiple Systems

Imagine a company has these systems:

1 E-commerce Website – handles orders online.

2 Warehouse System – manages stock and shipping.

3 Accounting System – handles invoices and payments.

4 CRM System – tracks customer details.

Each system stores customer and order data differently:

| System     | Customer Name           | Address Format                          | Order Info     |
| ---------- | ----------------------- | --------------------------------------- | -------------- |
| E-commerce | `firstName`, `lastName` | `street`, `city`, `zip`                 | `items[]`      |
| Warehouse  | `fullName`              | `streetLine1`, `cityName`, `postalCode` | `products[]`   |
| Accounting | `custName`              | `address`                               | `orderDetails` |
| CRM        | `name`                  | `addr`                                  | `purchases`    |


### Without a Canonical Model (Point-to-Point)

* To share order data from E-commerce → Warehouse → Accounting → CRM, you would need individual mappings between each pair of systems.

* Adding a new system means creating even more mappings.

* This gets messy quickly.


For example:

* E-commerce → Warehouse mapping

* E-commerce → Accounting mapping

* E-commerce → CRM mapping

* Warehouse → Accounting mapping
  … and so on.

If you have 5 systems, the number of mappings grows roughly.

### With a Canonical Data Model

Instead, you create a Canonical Model, a standard format for all data.

#### Example Canonical Model for Customer:

```json
{
  "customerId": "123",
  "fullName": "John Doe",
  "address": {
    "street": "123 Main St",
    "city": "New York",
    "zip": "10001"
  },
  "orders": [
    {
      "orderId": "001",
      "items": ["Shirt", "Shoes"],
      "total": 120.0
    }
  ]
}
```

* Each system only translates its data to/from this canonical model.

* Now, E-commerce, Warehouse, Accounting, and CRM don’t need to talk to each other directly—they just use the common model.


## Benefits in Real Life

### 1 Adding a new system (e.g., a new Marketing Tool) is easy:

     * Just map Marketing Tool data → Canonical Model → Other systems.

     * No need to map it to every other system individually.

### 2 Consistency:

     * “John Doe” is always represented the same way in all systems.

     * Addresses and orders follow a unified format.

### 3 Simpler maintenance:

     * If the way orders are represented changes, only update the mapping to/from the canonical model.

     * Other systems stay untouched.

### ✅ Analogy:
It’s like a universal translator in sci-fi movies: each alien only needs to translate to the “universal language,” instead of learning every alien’s language.


Here is the diagram of the Canonical Data Model:

![Canonical Data Model](../assets/canonical_model.png)