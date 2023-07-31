# Architecture Proposal

It is a basic and continuous [flutter](https://flutter.dev) project to save and present my clean architecture proposal.

Ler em [Português](https://github.com/Juniorlpes/architecture-proposal/blob/base-proposal/README-pt.md)

## Overview

Well, this proposal was based on [Reso Coder Proposal](https://resocoder.com/flutter-clean-architecture-tdd/) and [Flutterando proposal](https://github.com/Flutterando/Clean-Dart). I did some changes/improvements in both proposal considering some necessities, and of course, respecting the SOLID principles and the Clean Code.

This project has two branchs. <br />
The <strong>base-proposal</strong> branch is the clean proposal, it's just used only Dart/Flutter code without any external package, except the [dartz](https://pub.dev/packages/dartz) package that only provide useful dart classes. (see [Either](https://pub.dev/documentation/dartz/latest/dartz/Either-class.html) class)

The <strong>real-world</strong> branch is a "real world branch" where I use some external packages to support our daily development work, highlighting the [flutter_modular](https://pub.dev/packages/flutter_modular) package that manages the app's routes and binds, separating the features into modules like the Angular framework (Javascript).

## Explain

Here is the Uncle Bob's Clean Architecture Proposal

![image info](./readme_assets/CleanArchitecture.png)

Note that the divisions and the arrows representing the dependency flow.

I follow the [Reso Coder](https://resocoder.com/) dividing the features in three layers according the diagram:

![image info](./readme_assets/Clean-Architecture-Flutter-Diagram.png)

All features in my proposal follow the diagram's divisions.

In my proposal I tried to streamline a large amount of folders and files to avoid redundancy, but without wanting the principles, maintaining high cohesion and low coupling.

Speaking of loose coupling, the RestService class is the abstraction of a package for http requests, it knows the external package and all the datasources depend on it, so if the package for requests is replaced, only this class will have to be changed.

## Folders

Now I'll explain the folders organization.

In the root of the project (lib folder) I put three folders, features, core and shared.

The <strong>core</strong> folder is for putting "immutable" classes. Classes that you won't be using often in your development work. </br>
Ex: environment config, global services abstration etc.

The <strong>shared</strong> folder is for putting shared files for the whole project.</br>
Ex: enums, entities, extentions, constants etc.

The <strong>features or modules</strong> folder is for putting all the features of the project.</br>
<strong>Obs:</strong> Each module will be divided into three other folders referring to the three layers shown above in the image.

## Layers

The three layers are: <strong>domain</strong>, <strong>data</strong> and <strong>presenter</strong>.

The <strong>domain</strong> contains all business rules. It says <strong>what</strong> the module does.

The <strong>data</strong> layer tells <strong>how</strong> the module executes its tasks. </br>
All implementation, connection is done in this layer.

<strong>Note that:</strong> The repository on the image/diagram belongs the domain and the data layer, so the abstraction is in the domain, but its implementation is done in the data. </br>
I use the repository implementation to handle possible datasource errors.

Finally, the <strong>presenter</strong> layer takes care of the view, widgets and presenter logic. It only knows the module's use cases.
