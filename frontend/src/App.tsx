import { Route, BrowserRouter as Router, Routes } from 'react-router-dom';
import CreateTest from "./app/home/pages/CreateTest";
import ListTests from "./app/home/pages/ListTests";

// importar rotas de src/pages
import ActivePromosPage from "./app/home/pages/activePromosPage/activePromosPage";
import HomePage from "./app/home/pages/homePage/homePage";
import LoginPage from "./app/home/pages/loginPage/login";

export default function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/active-promos" element={<ActivePromosPage />} />
        <Route path="/create-test" element={<CreateTest />} />
        <Route path="/list-tests" element={<ListTests />} />
        <Route path="/login" element={<LoginPage />} />
      </Routes>
    </Router>
  );
}
