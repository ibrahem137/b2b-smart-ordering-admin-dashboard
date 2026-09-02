class CategoryActionFailure extends CategoryActionState {
  final String message;

  const CategoryActionFailure(this.message);
}

class CategoryActionInitial extends CategoryActionState {
  const CategoryActionInitial();
}

class CategoryActionLoading extends CategoryActionState {
  const CategoryActionLoading();
}

sealed class CategoryActionState {
  const CategoryActionState();
}

class CategoryActionSuccess extends CategoryActionState {
  final String message;

  const CategoryActionSuccess(this.message);
}
