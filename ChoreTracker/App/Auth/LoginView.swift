import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: AuthViewModel

    init(authService: AuthService) {
        self.viewModel = AuthViewModel(authService: authService)
    }

    var body: some View {
          VStack(spacing: 16) {
              Text("Login")
                  .font(.largeTitle)
                  .bold()

              TextField("Email", text: $viewModel.email)
                  .keyboardType(.emailAddress)
                  .textInputAutocapitalization(.never)
                  .autocorrectionDisabled()
                  .textFieldStyle(.roundedBorder)

              SecureField("Password", text: $viewModel.password)
                  .textFieldStyle(.roundedBorder)

              Button {
                  Task { await viewModel.signIn() }
              } label: {
                  if viewModel.isLoading {
                      ProgressView()
                  } else {
                      Text("Sign In")
                          .frame(maxWidth: .infinity)
                  }
              }
              .buttonStyle(.borderedProminent)
              .disabled(viewModel.isLoading)
          }
          .padding()
      }
}
