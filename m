Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA2033A6FE;
	Sun,  8 Mar 2026 20:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000191; cv=none; b=SdmrdBwBJY/FF6ziq2tuaHIgR4SJVaak1Tyx6BF8uv2wBCPPhtWatSAskjmFnJX69oLLVwvdiXQ8ZKpVry/sriWkS/IfnRwzMEB+PMOEhAC4RYB+casVfe5GWX8q3OqPCp84JA57vF1C4q86IqmF7rZDBk5Kr6mPcyn06Q51Nzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000191; c=relaxed/simple;
	bh=EIEAIMAWlivOEsKWrFH805avfGEQHpaDoGyT6YNUhJI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c4/dv72clEaP1ZO6bANdKbSqK+WYAcE6L6XHuuDi6Ax0zea0ExkPvq4dG+Own4auNV5uUfr3sgi1hNDm0SlDDBf3dxMNc74YxP5XTTVUIUCv9XxAOPb8s4xT/eNyUIgw2Dwzu0Ck53bUfTCe1P856auy6jQemy2J8gcn2sGBqqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Ojma0o3V; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Ojma0o3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773000164; x=1773604964; i=w_armin@gmx.de;
	bh=6sk9cZuhnKYi0MkbTnCeftlMbOwsXCX+l4ak3dLD9wk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ojma0o3VhUDIMZbuLGdGMeTumS9W+MULy6pzM3E5lJmfd9Gx4IkRqf/mCcUI5CQH
	 3mSxS5eGNftTz5B2/uwePwDG4E8fPJGjsmqr/WhUAqPenPwd9mpS/AagkijeRWBy/
	 5dboQvLWfEN7eQOMiMpqEyAkhhExB5o8sSsKFzZT9Wet9f5aVldhSJjkyM1rJrgl0
	 i+16MKaruM7HzFhrRIQ1ZaLBq2f3wXSbSOLwlVg2Md79aoLpE4ZF/8k288WeQs4s+
	 DTvqraoHMHU6Fnv2QO4pc400YWDheNIPG6S7ghWv+E65izWJSeUOaXwEuVIGnnGNH
	 tJiFL+kJkPFnWhWbpw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9MpS-1vc2BU1mkO-00xjdB; Sun, 08
 Mar 2026 21:02:44 +0100
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
Subject: [PATCH v2 9/9] modpost: Handle malformed WMI GUID strings
Date: Sun,  8 Mar 2026 21:01:55 +0100
Message-Id: <20260308200155.118950-10-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260308200155.118950-1-W_Armin@gmx.de>
References: <20260308200155.118950-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MYcgl7ySGH/E0JSSdxRWfoUmZ1Wx37wOEhhczKpvwaL4CEAtW9f
 A6KUpXsr2HuYP/FQQrn44YdotBA7A/LFUW6wBFJDlt2Wgh6p1HFdSZq6XVDzXbeskoGpoa0
 deXz5LpUMNEeSttiucXyZSfzVHkr39NM5rMrS1HY8a5jbMz3AX9HfBpQg3Z6yOZN0SE1gbl
 9rOSx6ljtF5QZJ2o1qf2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KTZuMQdA3pM=;xpKw6wuPtKG2e1YI2x8/HBeoLpc
 8JwYAKcHlBFR97sy8Sz8GOFFMxDWO4B9zx3DqK10IGFz977BmDyrNessAJvc1TX1VM6KtLFCb
 sBMLRcZjQcwiIMLm6iyR7NR66Bw0Qc9hzbkY7D+KymEexyKewyLtowJ0xmN2lHjxQONwKCm1A
 6nL4yDo1czP9gUarS7PTXoJu8d7EfHFexh9S+zGqchON3T1/UNZCg10EWa9PepPGN49yv2oO9
 UOkEbmWYmOA+S/hT9sLmiF6ptEIUvl+LWkDnPEuA+oGFxKUB/VIykIoK7JoznvCmyddMBqPuO
 YnZnnWANIStFvJVReFaOuU3UPDo9qQh/DFqJo0wES6cuoginQYTpEDZARjPCsUiAL6ej4yAsv
 vJ7KjympSQxZC/INMvIQ9M5FkpnCqKwISYm10a/dL4H+Ri9qNiYgCRYqRebJ04Q7c9TKHzpep
 qfax2U+unplBA2OdmmuoDnvQfewAbrxOcaP+aNGksIAvS5N3yZ8nsEYeGWM33hOcY3Q/I37YB
 88LhD/BJH+7kJYOMG1/18XypygaYouEopX32DkjEVUunkDQp4O2N0yKivueOCnrv+Ic1TBLNA
 uCmAziGnxnqg0eJ9rMhzWXhFtW6WVGh1Gdd26VwG++hkimC9G2VzpUTRsNTBsD9sneKU71yxi
 cMH3WXYz10Gd105I47f9s/BOErRNHN4ht7I8fqX4y3lcesenwc28+VvIRQ5HsBy4yS10/Jy/z
 xw9EAUhGlZeIB6/yzAY8e73AJt/UP+8/ZiUapnGpTG0gserLsVa9rbSWDA2rgv+T5uNFrDRcE
 yv9kQEgV3zPFh0JyCs1/E4ZzAeclnXaoeI759G+Bg3b9RI2Wl5C5jCezTbjrljQNhbUTcpOX/
 1v1zxa4ALQehCorX8zCyEpBCT0ghW4QLgUe1aRxHIlrwI27LZdNs/N8zFPALFQl+3Jgk5Im42
 007IWoE/OYmeToZLgfTPTAKkC3mNEyhG/isEHUfmxwG76R7/eXY2jAu+a8FunFVZOD3cCG3qC
 Fn1VkU7Ylpe2F//AElUmNPKev8ywL9Y1530VmI+NY+ZY4XA5Zu+Z+VFPA7guteTFgu3V5vzGt
 OblbrrSCpt6MTuJs3hhNMTY7CfFTKGrEGoPegZko+v5k7HjoUWjSZBVXP4JZpPY+S39P7G9ON
 /SxZPDqwANZe898UcAdZJ1Tczmkht2D4T1E4wovl/8mCDfW/0oJiDuHM1+OUoxohsujqiuxcb
 xya4DMxbN+OYTpywa53gw6/wEOfhaa24bu4g6egGthhfivrEjWTFxBiHNCj3WNSNzQubpF4IA
 Fi1lsT9pG3DuioliY/5YCatEIYt0K7h2D3/w5LN0IYNz65zwwgMIybN0JCw6eEQQ4ZYZJIod/
 m7Pyb1/Zw/e/vr3Mivc0MpPunn40kfpzmkhwD19S/2NYW9xLZ5GurBvNpMcVUVVoPJxHFd8w0
 CEQgFffVDKb1nII5UhLkAnVFhQeWreLTGQmKYGsCUSMeUFHD3yqHmjDGBPxvU+mTuqQyCH0K4
 uBlfv9Dyx/wbrVEUYClbCffJfRQVThihrnZbkeEvsgSoEXyFPmxeNkQdvOeEl+6gxzFjkkgwq
 ZckxW9oacn9/80+hcZn42yTa59r80LjBeOVo+A3V/0P6JSx4a6Mkoag+RhH6MRSAw/CIJ5RVw
 EQ+PBGOGJ0y0sWzz893XMce6CZdkX2cBemx2UvITWQpqlAOeL3MZR4BCnvTOQiq+VNJgjO2Og
 cHh1pUyTBv/KPAuaPozP30hYtpEjpGsfRhQ82NzZrHqY76TPkxudqGD0Uippo8PC6YTEXwX33
 3671X9Qkk/CHMTRbRUthHBVs+wm6uxWjxajZOO+HSrxO5RSXqm4wxaorjO7fN/FpfqVeInkEo
 JGWN8PZMjB0RIGsYAnpIscO10hvVM+qJerkcAwnrF4bljxMs9OztjliPgfZwlQH1ok9H8bBRF
 l0+tBFkwOQ+hrghRT1w8TFwZLcM02hqtcA3Y0fIJupuyA5bc62uGiESsZP/XeL6q1mGcwwn83
 665AdLKqe2q/Ubc6br3l/kpDayU4nBCasyDRC9NIPHk2BFifl1vlEodZAtnr7xvO9yFKQgxld
 Ybts+/1tVwW+rDXdABOHEEeB3/Wqi+RSSxgtXxclcFrUM1tLkGJVMIV1q1XVbfmsCTkP0/2oq
 iedREmcYacBSh6t8gHr2vEuGZzOUZL7WIcX4C47N76ZqZaAvDmW+61nE25PPHWeR3LY+EqvXC
 JKWzuHoBeEWrABDMjQH+DSymou7oAqAatbhqBj5j+FYLe/CfKcvdUJLuUd1XYWgBXe1iyJe1U
 eKvEh5z1VqDp0DQ2V9DHcs+X0sOj7v4mxfeh+OY2Wto8L1DGttXh6DxVjeRRt8cGIK+P8fIBu
 IL4ERgpa8sDV1R+RAaweDqWp3l24cOqijpo9f9rCu0KGbcD6TT031OIpdf/mhRL2Vccll0NeU
 87b1nmZf6Bk0Qw3R6do+P1nFcp3fX56uf7zvltT2reVfJvYtidadKGfS918yxaFLYp7AT7ZfD
 rOYGurXlknOvKEhf1KfquObds5SB1NeWkovcY5FWOVEgdME30tf7oCR9afcBTtRUYVpkTQ5jk
 MCriTnTZD+W55bIKcditDy8OWT/VelMJ/75vKiP1SA7SbTErljdwW7FUgs0l4ByWo/DWHHI5E
 hV10AGbstoZ6ziQ0n72eUXqFCLVoKAF4qwb9IKZSGI0eCTVXonRW0CI//bReN93zgZpbETv0R
 PvMQFSor+RQLUUSEzUCvoeeP/TZiwaYE0Q9W141jX/EnQfrdwohgfJd6Kbx6G5tpo99ogdcUH
 k0ngwEasRHElPU/tGWuTPASs44qFuD43P6c68Pcr5+XQPOCh8VuG8l4T9HsTirmDGx1S7u/6m
 7iksrcjqXRpchpuXVR4OY1WZ7f8dAm5BP0Nwa7xvIsY7LE8SU4o9ej2e01uri5v9gmfbXf+/W
 EYTvy4eY7KQRnG5oH2Txuisjzw2WTy+NkDeesKG9xxLEobXcgg7wzEP+drtdamTEdL9Vhe257
 ffb9wHvJnS06vGNed8xKT9R9GVWXVQmphiEclM+c6pXYOjTJ7laNAJ8eJ+HGKhE34/bC6XHaO
 KunlbKQrHDSju0qq6VsM01kTrdoe/vMUj4rFpAOAw46Bw8nO3j/zyhWl4k4eG9qtEnFYpzXuG
 TbF0wQhWmePlYDHrB8fGt2t+Au9CNtK8NDdpN3BKJJbzX9vOL1datKD5BYJZ2Aq837IwbjZZU
 gws9CtLnFQUiNwyM4M2OHFY94x3fMiMfVlrqgtI0jB+G4IRayrjl5jSDbRNswZJ0kkyqTLY8F
 WrApjhP1EOafkeZmYmkcYjU3SSDWp+6LCPLkLAB/z3SMhi5KKsl8H98B9JbS+Z77HfM7Xn633
 iAdoqL3xlFpBfiLt0KzP1VC8FdsuzMUnLP6L/EClkUv2wYqYcKHL8FxvW7G7yDVkoMrFVgAn3
 5Gfc6CQyAmEGftRg8dMG3vNaQQRrrHzYmkUMH2m3Jiu+r5BXx8fyGHqwlyAqDjMS2pLs7PTgU
 nW9H6PBvf60dERKkj0MM7zEe3gylZV0BC32vzDiWBrHJmXcP5iIBdqUIi0eoysRiuOzXBmXTc
 3+r+kzslUPTVg+k6VTc7KJcnO8JjXWCvqncbLUVFMpzkVNZk5pUhTFzhEY4bSoowc/i1fnRVD
 dyQWyLHtj5TopDMbvI3ZCr8NFWTi3EEEkINHkf1GkRSr/up9Ih0e4VAkAdMaS7WHGMqvX0Wuk
 Du6EkvmqZz2wbba+rjn/RFzcd8TkMx3G6OIrYcT3toPECGUL44n++gEnWHsjRAeaoP2YyxuNj
 Azs4FQp8aiUoQfLaDYaVaCOn+zYOM08rJLlMS/NJColNdvXseazymNHPKtMPNhQzyghZurxNI
 1tfQ+XykVnUpjySGKsEdw1yKxtlCWR76LwisQkJqS8P8HFZ9eYG1eWW7YudQzTfqZXnSGEAOx
 kQ0qon0AI22iw5N3Hu0YT7ZeRApH/CuD1eLqA0FCyaAP5Xd7MEGZ7WlHWKi79ehWzGqWBR7DJ
 hHfUMLTMajzwfiEv3EDEhsrA2FiBHLmedB4VBWzDZpdfqDavKIpAKVC0giP0NcMazh8IU5x8t
 z9ODDI62/yZz6R8YnrnAsctogpAEWnmDcQHgHufGufichhUtg/wpeZ59LeLWfGoipGaueb3oc
 jttrxifrWdsphlV2NV6i3ui2qJEjaZh0oRLlICpRU8XlT5GvPUYHpUVxLaIrO3ASJpK7GBGy8
 MeWgLZ83c6ywsCYO6y3KU4WUWjXutfLpd8Cwh/S1tWtoIg7LpWlRcBuZQQtGS5t19/rQXw09t
 7WgccsTulP74rTsaBkgvfeOzAM1D3MErIwpqsWHW09YeWQaqm8Mn380vQ8AJjtUG+7x4KM4un
 ogJo0IlVvbko1ymbAyJnZQ7qi5e824+Gv/rul0/joRb4OsmNItUbuMgX6qgUtQ3hHJOlerDtj
 h2J92glJaQdihYDn+krPBUH6Fz2iS21WRzyH2wuCaSiuN3KHpzbzStYrHI0auBSglOaFan7lw
 MYYdHcQ6CFOeZ7zFIAF2kBWrgejkd0SjVLfsoiuUiblWBfjia3JjZMWxfPkeumClfCcJJVNvb
 Letjq8R5raUA2cndYnn/xlBI82clckNFg7eNLDpSPXNAz2uOL+MluilIr58wE8tVAT1KGJCUk
 8arqVX2u/SWiq2CJd9ykeWqTiQEBgcWGR6MkGvki6hKlT711yz4+C567/IQTa7QICsNjcQpN8
 2zEA1u3Mx6yv8w3OTCUnCNjKUR5KoNmiSABS1+5DmU9EPs7B7JQA7VeoC8tX4Fkm4t3Xf46Si
 rrPYSA0+ntAg+44VA3O4uSVncaVW3wDzezJ+esSBoaUBMD62xH8YjkijuGCuxNCOQUrNzkuTx
 JPtBp8XdgkddPogSP/baZ9M3VqsAlq+9RAxZ/+77fBO+GiATe68kVceSAYnG7FiYQwl8GNKW1
 2OGM1GQdSyTP/MTWE6PGFp0OYsXSRzPP5QvVrEBwnw4586UnjjiVz9J/hSNdu8es2ilB8a40y
 4awSrQ8rmymFQr0MrdBukAQ+WTCvXuMAyAwRkDvFHM7BK8XA/NohB87kSpM8OzExPYtzyMl3F
 bhvh12N06h9nkr4CdvfhFg1xxaZjg98Ebmi1d8OdUEaw92ifj0w4dlnJSHqGqgi2wuEfUvrus
 6rnKft3YOMCnm6z2/1TmgFZd5mTuVd24NwuT8Y72nlTNk0drkvb3hzVF8Td1TUN6dRzXUTrE=

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

