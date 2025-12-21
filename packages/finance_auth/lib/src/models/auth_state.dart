enum AuthState {
  authenticated,
  unauthenticated,
  loading,
  error;

  bool get isAuthenticated => this == AuthState.authenticated;
  bool get isUnauthenticated => this == AuthState.unauthenticated;
  bool get isLoading => this == AuthState.loading;
  bool get isError => this == AuthState.error;
}
