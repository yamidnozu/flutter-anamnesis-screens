
# Anamnesis App

## Descripción
Anamnesis App es una aplicación desarrollada en Flutter para recolección de datos médicos 
en un flujo de dos pantallas, siguiendo un diseño fiel al prototipo proporcionado. 
Incluye validaciones, manejo de estado, navegación entre pantallas y soporte para 
múltiples tamaños de pantalla.

---

## Instrucciones para Ejecutar la Aplicación

1. **Requisitos Previos**:
   - Flutter SDK `>=3.0.0 <4.0.0`
   - Dart SDK compatible con Flutter 3.x
   - Tener configurado un emulador o dispositivo físico para pruebas.

2. **Clonar el Repositorio**:
   ```bash
   git clone https://github.com/yamidnozu/flutter-anamnesis-screens.git
   cd anamnesis_app
   ```

3. **Instalar Dependencias**:
   ```bash
   flutter pub get
   ```

4. **Ejecutar la Aplicación**:
   ```bash
   flutter run
   ```

5. **Pruebas**:
   Para ejecutar los tests:
   ```bash
   flutter test
   ```

---

## Gestión de Estado
La gestión de estado se realiza mediante el paquete `Provider`. Este enfoque permite 
separar la lógica de negocio de la UI y garantiza una actualización eficiente de los 
widgets que dependen del estado.

### Justificación de Uso
- **Provider** fue elegido por su simplicidad y compatibilidad con Flutter. 
  Es fácil de integrar, eficiente y permite inyectar el estado a nivel global o por pantalla.

---

## Estructura del Proyecto
```plaintext
lib/
├── main.dart                 # Punto de entrada de la app.
├── providers/
│   └── anamnesis_provider.dart # Lógica de estado y validaciones.
├── screens/
│   ├── anamnesis_step1.dart   # Pantalla 1 del flujo.
│   ├── anamnesis_step2.dart   # Pantalla 2 del flujo.
│   └── confirmation_screen.dart # Pantalla de confirmación.
├── theme/
│   ├── app_colors.dart        # Paleta de colores.
│   └── app_text_styles.dart   # Estilos de texto.
├── utils/
│   ├── constants.dart         # Valores constantes.
│   └── screen_size.dart       # Utilidad para tamaños responsivos.
├── widgets/
│   ├── custom_button.dart     # Botón personalizado.
│   ├── custom_text_field.dart # Campo de texto personalizado.
│   └── custom_toggle_button.dart # Botón de selección personalizado.
```
