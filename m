Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FA342CB08
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 05:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786080782; cv=none; b=OLxBebsuY1Y7dZaPWaZh6mjUPs+t93u/ywFciAdtM6xfe9sirtyNhhM9aTa0AG833uLWZzWK/tW0GPAL2wcG1LXerzNwH7b/PWmZ8C1ehH2N9VXkUEnFYXQUYBHlliAN9559lJr414/kdEbvPEoc2il74Zx0U+g2VsNN21Kol+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786080782; c=relaxed/simple;
	bh=9+wFogthNNBJOmWZyA/OSj+/XqWnBCmTKX7oLQBpg4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYHOrdnJ2zM9fzrx5g8PeY3iJoUKINvyCpJBiFz+nl2h5aMJc/BEXDMTTpWdfna12gMwq9dlE2s2PViSkIKte/08/ROU/jPL86rZC6qvLxGF0aQWbuCUXicl3u7I/00QKawyv4/QZt0qi9ooq3FsprtK0DmD5HzI0ezx6rgXKz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=dVEN92v7; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="dVEN92v7"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id D96D9240027
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 07:32:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1786080774;
	bh=EapNHpQAvGjTxIbFLczjBkQBnQuZ7BSPUfL1e4iPDv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:From;
	b=dVEN92v737ngzM6K+fZzYUBe1N5tJKhAbc7nkHFdeDQfx8YVzud7q0kXrXhZFzmm4
	 bzWYpgfBE/hSF+TdrVUyidzbrG8l5IvAvgv4JLXmhBSXp1q9jhsTh1DLI042a0jAEQ
	 VCRJwyf83x/tDkBb0v9SsfgJ5ZNq+DDqd/VK3ej3mwfiVcyBH4B90d1rv2T6hdzWo/
	 AnC8c0BsvUCR7usntyaof1BmNqbmGqhwm8qhS4/Xyy6HXlGDmAE73Oq798kRFVYpwE
	 OWDkF+WjhzNlNNzdZHgKQne7kvwDyahbA1wgCfzPbTJ8WMcP8RQLYV2gTTiGmoQ4YJ
	 sOGctBHlflJZA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hGXqB3Y89z6twP;
	Fri,  7 Aug 2026 07:32:54 +0200 (CEST)
Date: Fri, 07 Aug 2026 05:32:54 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: linux-kernel@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: corsair-psu: update documentation
Message-ID: <anVuBd8Bb7T66OUO@monster.localdomain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add information about the HX1500i 2025 series and fix the missing
HX1500i in Kbuild.

Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
---
 Documentation/hwmon/corsair-psu.rst | 6 +++---
 drivers/hwmon/Kconfig               | 4 ++--
 drivers/hwmon/corsair-psu.c         | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/corsair-psu.rst b/Documentation/hwmon/corsair-psu.rst
index 2e99cfd556a0..8d3636292076 100644
--- a/Documentation/hwmon/corsair-psu.rst
+++ b/Documentation/hwmon/corsair-psu.rst
@@ -19,7 +19,7 @@ Supported devices:
 
   Corsair HX1200i (Legacy, Series 2023 and Series 2025)
 
-  Corsair HX1500i (Legacy and Series 2023)
+  Corsair HX1500i (Legacy, Series 2023 and Series 2025)
 
   Corsair RM550i
 
@@ -93,8 +93,8 @@ Debugfs entries
 ---------------
 
 =======================	========================================================
-ocpmode                 Single or multi rail mode of the PCIe power connectors
-product                 Product name of the psu
+ocpmode			Single or multi rail mode of the PCIe power connectors
+product			Product name of the psu
 uptime			Session uptime of the psu
 uptime_total		Total uptime of the psu
 vendor			Vendor name of the psu
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 2bfbcc033d59..3d7cfa429f5d 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -506,8 +506,8 @@ config SENSORS_CORSAIR_PSU
 	  If you say yes here you get support for Corsair PSUs with a HID
 	  interface.
 	  Currently this driver supports the (RM/HX)550i, (RM/HX)650i,
-	  (RM/HX)750i, (RM/HX)850i, (RM/HX)1000i and HX1200i power supplies
-	  by Corsair.
+	  (RM/HX)750i, (RM/HX)850i, (RM/HX)1000i, HX1200i and HX1500i power
+	  supplies by Corsair.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called corsair-psu.
diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index ce958cdaef58..3b4cbf696e80 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -875,7 +875,7 @@ static const struct hid_device_id corsairpsu_idtable[] = {
 	{ HID_USB_DEVICE(0x1b1c, 0x1c0c) }, /* Corsair RM850i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c0d) }, /* Corsair RM1000i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c1e) }, /* Corsair HX1000i Series 2023 */
-	{ HID_USB_DEVICE(0x1b1c, 0x1c1f) }, /* Corsair HX1500i Legacy and Series 2023 */
+	{ HID_USB_DEVICE(0x1b1c, 0x1c1f) }, /* Corsair HX1500i Legacy, Series 2023 and 2025 */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c23) }, /* Corsair HX1200i Series 2023 */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c27) }, /* Corsair HX1200i Series 2025 */
 	{ },
-- 
2.55.0

