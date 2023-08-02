enum OperationKind { added, removed, updated }

class ListChangeNotification<E> {
  ListChangeNotification(this.element, this.op, this.pos);

  /// Returns notification with [OperationKind.added] operation.
  ListChangeNotification.added(this.element, this.pos)
      : op = OperationKind.added;

  /// Returns notification with [OperationKind.updated] operation.
  ListChangeNotification.updated(this.element, this.pos)
      : op = OperationKind.updated;

  /// Returns notification with [OperationKind.removed] operation.
  ListChangeNotification.removed(this.element, this.pos)
      : op = OperationKind.removed;

  /// Element being changed.
  final E element;

  /// Operation causing the [element] to change.
  final OperationKind op;

  /// Position of the changed [element].
  final int pos;
}
