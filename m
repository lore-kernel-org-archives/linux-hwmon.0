Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA413B42EB;
	Fri,  5 Jun 2026 18:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683313; cv=none; b=FlopzfoqBSOpXLmgXmdIuYb4rTQ2p8TVrBDOyt00GbpgjCmt6QkPl1qkyYB1o/cHa2cQhhejc8f7DjvS7pByNkar42i+ORVPYEo5gqy+oNRMcWypdfpxH7+cjzZYAEe9aDIt68mZ/VNR1M+uvZXIOkAIASPo850RW7HubnA+DZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683313; c=relaxed/simple;
	bh=xiMMiR9DQf/tWBjhVfGlftQFfGRRAKBqYvFODTT4jA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oDnhDfdV4xTcDm+3Dq+1mppi57ulg6lQnVh2wIaTtT09fZ3/y9h76dvRTHd1ouQCreg4Jhv0upt7UIq79MCnhDt+5CqSGhPro6f0OLSWb/Kofd+kTy3it9CuIqB5X3rkUUEwDjoC8paTA9NSGDU3NycogWUnsGrkwC25186V5QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=eY3yi0uA; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="eY3yi0uA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780683287; x=1781288087; i=w_armin@gmx.de;
	bh=YfeRLIATGWvAfNsgyiHcEHpJ2mxRTbC9ci0nIWnnk90=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eY3yi0uAoNMnY814yz/NVmcBP4fNjWSf3bolvEeJGWElpvpGx0QWS6CJcPlFwWVJ
	 sUhgyJAgL7mmjJTosistoiWWHAdnul/dqTW4skjbImf6/i80JYGLdQVjFPzaCbFvm
	 ID0klR2hqyfqLiDy+UO7504Mty9ZlkvLtL6B1PRjRnwEoJ4oVC9j0o4b/p4Z6CrVJ
	 EJ5IoHB1vcGzN9ybKcGNfRsH7I1vsxQmZMW4d6fAm/nIkHIgS7l8iuFisnNg5b04J
	 yV29Lt5zC+17KvwYDiVfs3j5KIkbNZKzP7nBf6h+0kTC6Rz/rBTJSBLVGi9O4XgOY
	 keSTFoTAQsHAk0pj5w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fmq-1xG0nG3c5o-00wHBl; Fri, 05
 Jun 2026 20:14:46 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	pali@kernel.org,
	mjg59@srcf.ucam.org
Cc: soyer@irl.hu,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	mario.limonciello@amd.com
Subject: [PATCH v4 9/9] modpost: Handle malformed WMI GUID strings
Date: Fri,  5 Jun 2026 20:14:33 +0200
Message-Id: <20260605181433.188847-10-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605181433.188847-1-W_Armin@gmx.de>
References: <20260605181433.188847-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uCxzTofn4Zu2EWwQCRx78X6Cl3jOqn8PI7u542+4pzp9F3V2sH0
 bl1A5qp1XtYHWFYwU7/HeXU61OL9KHZpgzlsI88vITftRPHJh9kl2UjLap5th7+NVXddO4L
 yGrmc1dLK1XW/rv2efjtr3A3CK2f4eYFTOEqBkev6bZiLBZItJlsvX0+RY51SwgrJNfCLNk
 9xRKFX5cqnOq+LHL+eexw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/YgkSDc1NTc=;0a00HNpCSeFv2+MDC3CKSBO97t5
 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

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
index 387f508d57ad..6290c448f5e7 100644
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

