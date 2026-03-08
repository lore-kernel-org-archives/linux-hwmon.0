Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9414B213254;
	Sun,  8 Mar 2026 00:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772929561; cv=none; b=ue5WV26eRKxWX4dy/CZ3fsJ/OHwNsJ1UR2a1cWNDBIoTxhL6i+p5cQVkttoj/llXh0UGwDtKCzEIyUnL5qc6ZqrEKadJ7e0261tHql8kl8t8V+TFo6Z0/IbFSBn9jdWnol++XHCTUp/KqqnG0F4wGjHU3JBUDBxHPxTfNOZmI8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772929561; c=relaxed/simple;
	bh=EIEAIMAWlivOEsKWrFH805avfGEQHpaDoGyT6YNUhJI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nGjQkIFehr/wKr+4eSBVeP+rg1EzbdzYrGrNit7g5j/Tib408LQtvVclkHSTDeUR17gtnJ6tR9hd9vuAai5VXGTkLduxLy/NCuJ7ctmdSosfFLcF7YjVB12njnjXGqX+JURvcnIXG9dFT1DSdIcY8Jf/Hw/hc7a2dzLP2AeZQoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cAwRT35C; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cAwRT35C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772929538; x=1773534338; i=w_armin@gmx.de;
	bh=6sk9cZuhnKYi0MkbTnCeftlMbOwsXCX+l4ak3dLD9wk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cAwRT35Cc51FdJskIUrHccTMSxC5FQPgZD8VHB5YXqNSLuWJcjzmyYJUzdmR2hSr
	 QJpTRXwEgDjHe3TTac3b/QB1iqta0H7CnWti3crpK09+ZSQG7U0oc4MsCUtk6GIxJ
	 ZwERA4+UVZhe5uFJUa5hJ9hMTeuKdqdw92crg580cG6Aa7zhR0VDlR730QUDeXZku
	 APe50R/rai8LJtgziqBdkVy9UWnDJBePiDfQGaiA5fAVCNCSaLopAHu30a2XRfyRJ
	 r2SpH91rqaJQju2xiBW9de6a4ka3H4wX12QhxSQH/GLp/66PN06psbJhpDGnSDweO
	 LdJi9o6CX5I9hmX7ZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAwbp-1voLnP1gEb-0082Nx; Sun, 08
 Mar 2026 01:25:38 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	pali@kernel.org,
	mjg59@srcf.ucam.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 9/9] modpost: Handle malformed WMI GUID strings
Date: Sun,  8 Mar 2026 01:25:22 +0100
Message-Id: <20260308002522.4185-10-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260308002522.4185-1-W_Armin@gmx.de>
References: <20260308002522.4185-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bzeM10vpnhivd1En9jaZx/dwVVTpiFCmB+zHKb2lyR+Mm3zHBOz
 o8Fn5Oe5kj8Pl1ibexxIDR0wSlg5LklT9t/6sEvp/9yzgHycXbMpe8kPNZ++r/GJ/C57tAr
 kqqiDpsKtivg1woTxpoW8LaU2jRFYvR0AGVHbMflXsh3/A4d30L1LeoSH7Im01Xe3kjqFrI
 cSND2o+oGMMyfolHBFj0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/Ddaqji19XM=;CZsNUzHItbEqYiKFlBZluYU/hmy
 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
 K6cKB3f2DyTWMJ0YEJxHVIh4HmeCC

Some WMI GUIDs found inside binary MOF files contain both
uppercase and lowercase characters. Blindly copying such
GUIDs will prevent the associated WMI driver from loading
automatically because the WMI GUID found inside WMI device ids
always contains uppercase characters.

Avoid this issue by always converting WMI GUID strings to
uppercase. Also verify that the WMI GUID string actually looks
like a valid GUID.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../wmi/driver-development-guide.rst          |  2 +-
 scripts/mod/file2alias.c                      | 28 ++++++++++++++++++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/wmi/driver-development-guide.rst b/Documentatio=
n/wmi/driver-development-guide.rst
index fbc2d9b12fe9..74bb156ad9cc 100644
=2D-- a/Documentation/wmi/driver-development-guide.rst
+++ b/Documentation/wmi/driver-development-guide.rst
@@ -54,7 +54,7 @@ to matching WMI devices using a struct wmi_device_id tab=
le:
 ::
=20
   static const struct wmi_device_id foo_id_table[] =3D {
-         /* Only use uppercase letters! */
+         /* Using only uppercase letters is recommended */
          { "936DA01F-9ABD-4D9D-80C7-02AF85C822A8", NULL },
          { }
   };
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 4e99393a35f1..20e542a888c4 100644
=2D-- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1253,6 +1253,8 @@ static void do_tee_entry(struct module *mod, void *s=
ymval)
 static void do_wmi_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, wmi_device_id, guid_string);
+	char result[sizeof(*guid_string)];
+	int i;
=20
 	if (strlen(*guid_string) !=3D UUID_STRING_LEN) {
 		warn("Invalid WMI device id 'wmi:%s' in '%s'\n",
@@ -1260,7 +1262,31 @@ static void do_wmi_entry(struct module *mod, void *=
symval)
 		return;
 	}
=20
-	module_alias_printf(mod, false, WMI_MODULE_PREFIX "%s", *guid_string);
+	for (i =3D 0; i < UUID_STRING_LEN; i++) {
+		char value =3D (*guid_string)[i];
+		bool valid =3D false;
+
+		if (i =3D=3D 8 || i =3D=3D 13 || i =3D=3D 18 || i =3D=3D 23) {
+			if (value =3D=3D '-')
+				valid =3D true;
+		} else {
+			if (isxdigit(value))
+				valid =3D true;
+		}
+
+		if (!valid) {
+			warn("Invalid character %c inside WMI GUID string '%s' in '%s'\n",
+			     value, *guid_string, mod->name);
+			return;
+		}
+
+		/* Some GUIDs from BMOF definitions contain lowercase characters */
+		result[i] =3D toupper(value);
+	}
+
+	result[i] =3D '\0';
+
+	module_alias_printf(mod, false, WMI_MODULE_PREFIX "%s", result);
 }
=20
 /* Looks like: mhi:S */
=2D-=20
2.39.5

