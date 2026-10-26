import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PerfilScreen extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggleTheme;
  final VoidCallback onOpenNotifications;
  final VoidCallback onLogout;

  const PerfilScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onOpenNotifications,
    required this.onLogout,
  });

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  String _phone = '+52 55 7824 1096';
  String _email = 'Sin registrar';
  String _city = 'Ciudad de México';
  String _name = 'Saul Cruz';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Profile Photo Card with Edit Badge (Artisan Monogram, no AI artifacts)
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00E599), Color(0xFF059669)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: AppColors.border, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.mint.withValues(alpha: 0.25),
                            blurRadius: 14,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'SC',
                          style: TextStyle(
                            color: Color(0xFF042018),
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -4,
                      right: -4,
                      child: InkWell(
                        onTap: () => _editProfileInfo(context),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.mint,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.background, width: 2.5),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 13,
                            color: Color(0xFF091619),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Name & Role
              Text(
                _name,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Jardinero profesional • $_city',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 22),

              // Contact 2-Column Row
              Row(
                children: [
                  Expanded(
                    child: _buildContactTile(
                      icon: Icons.phone_outlined,
                      label: 'TELÉFONO',
                      value: _phone,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildContactTile(
                      icon: Icons.mail_outline_rounded,
                      label: 'CORREO',
                      value: _email,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // City Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceCard,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.border, width: 1),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: AppColors.mint,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CIUDAD',
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 10,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _city,
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 13.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Green Button: Editar mis datos
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _editProfileInfo(context),
                  icon: const Icon(Icons.edit_outlined, size: 18, color: Color(0xFF091619)),
                  label: const Text(
                    'Editar mis datos',
                    style: TextStyle(
                      color: Color(0xFF091619),
                      fontSize: 14.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mint,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 0,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // Menu Card: Información del negocio & Notificaciones
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceCard,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border, width: 1),
                ),
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Icons.eco_outlined,
                      title: 'Información del negocio',
                      onTap: () {
                        _showBusinessInfo(context);
                      },
                    ),
                    Container(height: 1, color: AppColors.borderSubtle),
                    _buildMenuItem(
                      icon: Icons.notifications_none_rounded,
                      title: 'Notificaciones',
                      onTap: widget.onOpenNotifications,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Dark Mode Toggle Card
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceCard,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border, width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: widget.isDarkMode ? const Color(0xFF162734) : const Color(0xFFE2E8F0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        widget.isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                        color: widget.isDarkMode ? AppColors.cyan : AppColors.amber,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Modo oscuro',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            'Reduce el brillo de la interfaz',
                            style: TextStyle(
                              color: AppColors.textMuted,
                              fontSize: 11.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: widget.isDarkMode,
                      activeThumbColor: AppColors.mint,
                      activeTrackColor: AppColors.mint.withValues(alpha: 0.3),
                      inactiveThumbColor: AppColors.textMuted,
                      inactiveTrackColor: const Color(0xFFD1D5DB),
                      onChanged: widget.onToggleTheme,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Logout Button
              TextButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: AppColors.surfaceCard,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      title: Text(
                        'Cerrar sesión',
                        style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
                      ),
                      content: Text(
                        '¿Estás seguro de que deseas salir del sistema?',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancelar', style: TextStyle(color: AppColors.textMuted)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            widget.onLogout();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEF4444),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text('Salir', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.logout_rounded,
                  color: Color(0xFFF87171),
                  size: 18,
                ),
                label: const Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    color: Color(0xFFF87171),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.mint, size: 20),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 10,
              letterSpacing: 1.1,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: AppColors.mint, size: 20),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textMuted,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _editProfileInfo(BuildContext context) {
    final nameCtrl = TextEditingController(text: _name);
    final phoneCtrl = TextEditingController(text: _phone);
    final emailCtrl = TextEditingController(text: _email == 'Sin registrar' ? '' : _email);
    final cityCtrl = TextEditingController(text: _city);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surfaceCard,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Editar mis datos', style: TextStyle(color: AppColors.textPrimary)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameCtrl,
                  style: TextStyle(color: AppColors.textPrimary),
                  decoration: const InputDecoration(labelText: 'Nombre completo'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: phoneCtrl,
                  style: TextStyle(color: AppColors.textPrimary),
                  decoration: const InputDecoration(labelText: 'Teléfono'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailCtrl,
                  style: TextStyle(color: AppColors.textPrimary),
                  decoration: const InputDecoration(labelText: 'Correo electrónico'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: cityCtrl,
                  style: TextStyle(color: AppColors.textPrimary),
                  decoration: const InputDecoration(labelText: 'Ciudad'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar', style: TextStyle(color: AppColors.textMuted)),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _name = nameCtrl.text;
                  _phone = phoneCtrl.text;
                  _email = emailCtrl.text.isEmpty ? 'Sin registrar' : emailCtrl.text;
                  _city = cityCtrl.text;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Datos actualizados correctamente')),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.mint),
              child: const Text('Guardar', style: TextStyle(color: Color(0xFF091619))),
            ),
          ],
        );
      },
    );
  }

  void _showBusinessInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surfaceCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jardineros Al Rescate S.A.P.I.',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Especialistas en diseño paisajístico, instalación de pasto en rollo, nivelación y mantenimiento integral de áreas verdes residenciales y comerciales.',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
              const SizedBox(height: 16),
              const Text('RFC: JAL210915AB3', style: TextStyle(color: AppColors.mint, fontWeight: FontWeight.bold)),
              Text('Horario de atención: Lun - Sáb: 7:00 AM - 6:00 PM', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
            ],
          ),
        );
      },
    );
  }
}
