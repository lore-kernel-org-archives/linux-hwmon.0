Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34185 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751788AbcFZCkj (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 25 Jun 2016 22:40:39 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: Nishanth Menon <nm@ti.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 2/5] hwmon: (tmp102) Drop FSF address
Date: Sat, 25 Jun 2016 19:40:22 -0700
Message-Id: <1466908825-14222-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1466908825-14222-1-git-send-email-linux@roeck-us.net>
References: <1466908825-14222-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The FSF address can change, so drop it from the driver.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 drivers/hwmon/tmp102.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index befd06b6f3a5..5bdf262e6a0e 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -11,10 +11,6 @@
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA
  */
 
 #include <linux/module.h>
-- 
2.5.0

