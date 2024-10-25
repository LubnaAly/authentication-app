# Authentication
Authentication is a demo app to mock the authentication feature, by entering and validating user data.

## Usage
1) *Sign up*: Create an account using valid user data.
2) *Sign in*: Access your account.
3) *Profile*: Check your data.

Sign Up | Sign In
:-: | :-:
<video src='https://github.com/user-attachments/assets/be952d28-8212-4cae-b18e-0755967b9dff' width=90% controls autoplay> | <video src='https://github.com/user-attachments/assets/0f2978a4-0f7f-42e3-96cf-afb6e0455a63' width=90% controls autoplay>

## Concepts
* **Architecture**: Model-View-Controller (MVC).
* **Design Patterns**:
  * *Creational*: Singleton
  * *Structural*: Adapter
  * *Behavioral*: Delegation, and Observer.

## Technologies
* **Data Persistence**: `UserDefaults`, and `SQLite` Database.
* **Package Manager**: Swift Package Manager (SPM)
* **Packages/Dependencies**:
  * `GRDB`: A `SQLite` wrapper.
  * `IQKeyboardManager`: Prevent issues of keyboard sliding up and covering `UITextField`s. 
