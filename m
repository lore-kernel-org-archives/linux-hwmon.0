Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615163A7F4B;
	Fri,  5 Jun 2026 20:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693202; cv=none; b=ftXtPtX+zK5QwUa7w2QnrpkLCpo6ys8WfkOlhnS5q0KhlRZ8ang1Ldi7yzr3KCECvbgt1Fs5l94Ul8oQv7pR9hQYhTVGoZhfZ+5LIY1EHl+eTLs+o4BYn+LE37FzPWYZ3UiJdCZdkSNlxWf64SSeWpuDFGMcgwZkN9KRcPDfezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693202; c=relaxed/simple;
	bh=xiMMiR9DQf/tWBjhVfGlftQFfGRRAKBqYvFODTT4jA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jx02NBMfgjbQLuUY8+uf9eriwB+0PowPly/3KQVrxE85aAQEAilHAtiK+IDkQ/c1Ztn/o3kU5t+ZH6os5kfgJtA0xGWRlWqaZAJhUsaDqs1mvkV1TmIZYuzTxtNEYvf7Fmka31RABYGT7dZ9OCLP6I4tjyRhVql0NPfDf98ewTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aiyqszqR; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aiyqszqR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780693193; x=1781297993; i=w_armin@gmx.de;
	bh=YfeRLIATGWvAfNsgyiHcEHpJ2mxRTbC9ci0nIWnnk90=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aiyqszqR4VhDFKnPNcFCsUIeYGUOR286bk0TpOK0CDvmrwnjjPi11dVQBEeQdLg/
	 fNsFTkDUY6SULSj9bWrOcJ8/Vm8Zd7WoIrVxt6I+PZ8EydrwZMJU7YI9jwJLQvgYB
	 UOXtOlLv6I9HB6pViNDRSIXDV37CPhO+o3MueiR65OrEpRXOV5Hx6vV+To7ynNZ6B
	 jNrzCAWXHDBOX1UkZUhL+WSpjCIlSnbWxQykcnGFtMy6izyQ5ROIyceyQ9PQMWJkp
	 jnTGEB7OsNiuPTddEzopdyA2Rdz6UgFee/DetmNMoeGxqp1p5IJWblWsmId1AeH+o
	 LpLILfaYZBPjiGyLkQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1ML9yS-1wmj3T0zkg-00PVyx; Fri, 05
 Jun 2026 22:59:53 +0200
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
Subject: [PATCH v5 9/9] modpost: Handle malformed WMI GUID strings
Date: Fri,  5 Jun 2026 22:59:37 +0200
Message-Id: <20260605205937.530897-10-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605205937.530897-1-W_Armin@gmx.de>
References: <20260605205937.530897-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KGTwj0aObUe6FsyEc4rODcmjr3RtxqCLeIrdHI/HKa6oqnwXS65
 lVXeEidFwsR4J7PHr47PsJmSBpdMICXqZhXtOwgOKVhkyFNdfImmu5Jh/hPbq32DNtZSNvI
 zzG3Z25Dl3iDMDpzfT99gQZJCJas/oaE4Z1cLjFPzizL3f0bSCwT6aYKxSB6WVgxlxSFXJr
 +Ef1ZcZSiJfOfU4caKZJA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W7bJcUJVZaA=;H95Ie+NsI2bTYQpIbZzdR6b7e4m
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

