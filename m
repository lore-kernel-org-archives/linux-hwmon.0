Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B43328B61;
	Sat, 14 Mar 2026 17:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773510799; cv=none; b=jGXq79fTj5/rrZxxLygewmXzuR+gjP7rwI0QkrhIh5bxZ2N7KRwOySBPmeBsG+a2CzwBFxmaseOstFr77POp2jlSSZyCVasfh8uzZj9ppUUCzBlqvO13LIkj7LWXwJ5GKind0DgAxWUlfwiRpH9wW+XArNgb8eXYOxtcPG7mxOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773510799; c=relaxed/simple;
	bh=EIEAIMAWlivOEsKWrFH805avfGEQHpaDoGyT6YNUhJI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TgCm0EficI3EbgEdPYjzwFdCyH14mcGsJ4jn2VcEt0giLLDN+GqEI3YEIqC2iuGDOCERmvih8Z5hY3czNxTXAMqbet4OmL0H+MgFih+4YJG4JVl3V3dQ1bbxrD6My5chQV7ZyRYpqwQTWN/ZhPt/U90GIhDv3vNXnu+oXgki/f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=NUbFn5t0; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="NUbFn5t0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773510795; x=1774115595; i=w_armin@gmx.de;
	bh=6sk9cZuhnKYi0MkbTnCeftlMbOwsXCX+l4ak3dLD9wk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NUbFn5t0Ckmo8X1SQwCjDg9/9Ya8M4V+MMZGy4z5FaWBkrjJyKOn7/2/wRpDKGYQ
	 +AP+ENtFktgllzQrHdl5H47pHEPt5QQIvEVKx+29MncQqaTlJBoQK2SRJ3VjbI+oC
	 rLPKATZSuuRvtDyYjGHVdAEqodg1Wyn6YoI+m6T4DLH0cEygMki1MTcC96BsQipqE
	 rXeJpqRtP8nUA5RpE0qsbs/Hfk1EUNFOTJFX8wtJfaQL9yt+4QBwAYGrqWfW7d6N4
	 HFUaJRmQcVjL5memXx9zVWvFlYkiMwgnIncyUjgXYL05HV60lM64WLBf7xp7hepPf
	 byGWmta72Bd2R9Ie4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6lpM-1vykgX1dle-0080g1; Sat, 14
 Mar 2026 18:53:15 +0100
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
Subject: [PATCH v3 9/9] modpost: Handle malformed WMI GUID strings
Date: Sat, 14 Mar 2026 18:52:49 +0100
Message-Id: <20260314175249.16040-10-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260314175249.16040-1-W_Armin@gmx.de>
References: <20260314175249.16040-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2xx2wJcvi3s1lxOZEc7+pXvWEsyO+01kDe1RAh9kNtuf1vtQmhl
 WZasNiMjHqWn2ufl9RNOGsSqUtgU5YQ/KfORtYlhsAmhvur+au9vYi5ZKSB+qdD3+oG7+Wq
 tBGu5cYEr3pnVNlECjQ4oCVCMiJ56buzelrZe/XWhGI9W4a0YhhJSMQhSithjdQD0NjCY+7
 Eu1ZAq3QhS7GniYQT/vjw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6qdx5rtP2co=;xtIOQg/LgjrP8e0ZrgVwZ8CDSI0
 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
 zpKq6uWEzSw

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

