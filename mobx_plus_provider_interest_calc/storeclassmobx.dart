import 'package:mobx/mobx.dart';
part 'storeclassmobx.g.dart';

class MobStore = MobStorebase with _$MobStore;

abstract class MobStorebase with Store {
  @observable
  int a = 0;

  @action
  void inc() {
    a++;
    principal++;
  }

  @observable
  int principal = 0;

  @observable
  double interestRate = 0;

  @observable
  int mon = 0;

  @observable
  double years = 0;

  @observable
  double newval = 0;

  @action
  double totalInterest() {
    years = mon! / 12;

    return newval = ((principal * interestRate * years) / 100);
  }
}
