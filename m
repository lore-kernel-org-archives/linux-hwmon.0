Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D484A33E9;
	Wed, 10 Jun 2026 20:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123731; cv=none; b=s8yW7+r2a/o3SkrP5H6sDW/EnPazzYYVhlKwsJrtHc1XjiP+DUqTFHzcjUdHkriMtdr3dD92N7MNQ04XCvK4SMajnkB64WPFP3m5LB6QIJoq324MXjnENMYBjLGAViEKvyaDuk0XIpD6iotDM9Sq4RDkvi4rivcxYMa2yf8/u1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123731; c=relaxed/simple;
	bh=xiMMiR9DQf/tWBjhVfGlftQFfGRRAKBqYvFODTT4jA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lId6dqMUmcK/ICTlhIOaIyNT3aIq5cRdghBkJk4m3i09xCp2/p4445Zn0Rk2iq47768fi1+V3Mba6Rne1rHJMRkrfF6+hqFHPsbUaJbNLyMi+D1V2+jQzUMR3DTFQWRYAXM5HkR9hzBDsRPwzxJYqHLhRXQyi1dYnh/l9hDL07I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=U5PgMaZz; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="U5PgMaZz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781123724; x=1781728524; i=w_armin@gmx.de;
	bh=YfeRLIATGWvAfNsgyiHcEHpJ2mxRTbC9ci0nIWnnk90=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=U5PgMaZzfo50mD6vJMWUVl90MQXZpV40Kn8qOLgXf+RG6eJ8FiXHBw7K7xWWV5Pg
	 pk3anU2/a8rjJc92EGAsU99BLez7p6ODospNpPnkcuexGTgQzwISnzHHEs8y8DJwG
	 3TPM3ogczUtcxm9sFR3rpnht694cpnkoEzhVYz+JenxinUGl/qbwL03DyPMk6pSC/
	 VNa1Bt7S4rK/TErsfjmPOEp2K9FDCZ3w+MOpdzJzoFDxhqZBClmt2hth5gQmixDwU
	 m41Ma2HD657+OqlO0Ze8hht937JyeoUK468TfwQ1WTm386LZoQYFAuTMJe+p6HIJq
	 OJvP9YiHJmvyO4lUFg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2Dx8-1xEgJ013Wg-00u7pa; Wed, 10
 Jun 2026 22:35:24 +0200
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
Subject: [PATCH v6 9/9] modpost: Handle malformed WMI GUID strings
Date: Wed, 10 Jun 2026 22:34:53 +0200
Message-Id: <20260610203453.816254-10-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260610203453.816254-1-W_Armin@gmx.de>
References: <20260610203453.816254-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lQVC8LxkO3Lo5eWw9HCrXuByDZaD7DrebASYK5HaZJijGeaNQZU
 bZSBvcsaJV1UlHznkyodwvutq68RqsQ39Rl6v9Br7tWOaS/AbCUULU1B82QwWNIZQBVfv8H
 mg6RcKxR+OQyKIKKLSjpI/fao5Ka7wxeSWHpdQ/DyoJfxUEmVNicX/r4RO+vuoF2Bw7omJX
 TcycBtTWAIvBjxmE5qo+Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kO2jdMcJQb8=;QFBhYtXarMEDpCfkZFPJiZWIldD
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

