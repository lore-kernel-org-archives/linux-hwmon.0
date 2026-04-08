Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942BA37C0FA
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Apr 2026 23:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775692647; cv=pass; b=VbxKuy6KsRiUEXPX69YcWlA4OIJRrwaWMo96O2/PvVT1pNmu5qNkTVt03fskD3G5fVPUJUVP0684iXBbcYl+/CvE5geK11LwudIe8F58Q0pPvCGIifZGNxY7GvSJQ2UjKgH4D9P6HA1cxLuaolsGRM+84QfA9oSFnQo/L9YOq04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775692647; c=relaxed/simple;
	bh=FSImeD+9EZuioDpwFxvxJHBV1jIaQo/HbiekQn3GNKc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YnPJQ8/gWsDOG7zahFjpLrydr4mXYVH4tEdoId8c8r3PqG3/U3b2qu50s2jqk4z0bf1HCLzZ100TB9xmcL77R3g0wNRfr3vGY+9G0N3ztHE4PooOGKhh+SFl7VpenywUEiaSUtHzPTsEqaFwUDcz25Tb3KQBxwNKhD5mLSoaYa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wa7q5Vss; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wa7q5Vss"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so267230e87.2
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Apr 2026 16:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775692645; cv=none;
        d=google.com; s=arc-20240605;
        b=GvrcklD0y5MO4gIv8j/e2tRYtOS3Ka6aCGWTne1IXktrbwaBB6Nzc/AY9gePvaJGCx
         f3lc49G6gIGhTxPSfirMEak8H/B/sXl7hAU46VQDAm3f2yftw0lUwpYtWWvxL3qkLLWj
         K37fCOyZ+HlX/yUCOCkXhyb6Hy8bWsUCYrEEZkesSiOKX9TTArI0j6y8cgHkfug8yJLx
         ggDLlPPoImcFLCtSCZBlj/Yw3Gt2/e1n7M2iLTFNvEitprVSdOoRHVDs7BPcJZ1LI5n+
         4LpGIdTBVJbtWhz4MN3/YWPuv2kXvdJhRj4HDnkVG1J02KUaX7AgTBRba8h0Yxe8Oo6T
         gNNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FSImeD+9EZuioDpwFxvxJHBV1jIaQo/HbiekQn3GNKc=;
        fh=vV3aw1K574njOGgmn/CLZ/NNNPvbJCO++hKCwQXGpI4=;
        b=VyAzp30HnRJYrWWoEZia9iyAMg8akL9uXTaSomkIvShH+zHaeJgQFwsz5QSujxHNm+
         8MIHOiHuQt+vGAALKp3811u0oJXR547NNrDS9owm/wXF62C0btjIjgQpXNM+ahoIJmua
         xVH2kzfXFQq+dCEqaH3wWG7MvPLpPseWrEEEvHEjzHZalUQwm707UshsR+AO7wPpbAnz
         6MVLQoQGJ/oEkDKKzJ+sxKyhQ3FAPyJgYjM+FxdW9RkIHDrIocOxiR568k7WmyR47c6I
         DATLTxCQ483TDAMBUU1CMhuDVCWxDR4uItMPLRNGhqFyCRU3jrnBntF29YiLor5I399J
         lT3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775692645; x=1776297445; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FSImeD+9EZuioDpwFxvxJHBV1jIaQo/HbiekQn3GNKc=;
        b=Wa7q5VssR/iQhZjE2QwOdIKe8hVON1ShiRggQ3E1EG+F3mLSK48+F0zPV8CCRujTlW
         kGf8KEhMTM3md2Ee0TtvtX4oBXaA+lMT0ynvBxmtK1byjM8zLkdRHe74up4DPbUlYlFl
         P1KqzQr39ClmLL6t4oM+v/yecO5dvnkctw+4hMb7Yj9PBjhOaNL5/Uv/rvkAoHZcFMZg
         oMPtPoQY0j9lWiq7TR91k4gjmvtfE6K0z7iwn/laVXQBnRVm4Kujhfzhl6+qjb0EVen2
         9j6vB+PiLuTyL86SHzhjrzbAKAA3tWXjsKQnaxqz6sNnKMGq6AUSY03yIhrEJT2pub2a
         XAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775692645; x=1776297445;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSImeD+9EZuioDpwFxvxJHBV1jIaQo/HbiekQn3GNKc=;
        b=ZWN5r2To1BgzJGsSWaze0/qXabivs4TLTuaeOGqTQYKYOhfivISMBHPzP9kWXqOLsa
         s3vLz4Dn3NYYT8zA/gvXjq8m+vHmsTQP1i8bvGVzl32Iu4fT/HlAXlAFblZhwdMPtwXu
         LkHjMndOoJDfEvk8mMFU33FGg/BoJl/SfitKwF7zRoqP3TjiYpOySBsZcIgHd/48KVhN
         SuAcHDzl25f8swLW0E2f8TuO0daL5M0VaVjYKf80UA/SNZrwlz4ENVa1DOshEE1oPw86
         47lryjal79d8Zxw4SjUDSKdJlsP8l4Mnzm4r6V8AcKl5mGP0sBw78wVpk4a1R7oBXr6Q
         1f6Q==
X-Gm-Message-State: AOJu0YyPh5cuq3vWStIAASq6QFiTpMjkKmGj1kfWJW243GoHzuVHSARs
	CUj6HbhBAiRPqz5N//QphN3nUOM31R4r7yeIV1RAipCP1dcDzN7q46iOjWoEN7k9jp/+T/uzFhV
	XzZ4JiIZ/K6JCSydGsv4qwuKZ8hZfYPo=
X-Gm-Gg: AeBDies41pMfO2huYzaPoDnLj4tdNgkD/S8MCDCg6HIczs0zPX3W+yXNCfjG0l5oiJL
	7lswvLlcRPKns6W4zdqde+LXRxtaW3PF/tkv29vHbpWufEJsz2xzeoyFv/NCPdwmuxwLfDHHbl9
	Ta7LFZn5B/0Vc4ReFC2oLXa1MesWUSRo0GTYIjDpEy6qPTEzdDMpp9qSSxjMr/p+qy8OOZkE4t5
	rC96GEHGVp4BTD7ULHmsARqKspDjJ7A40nCiNYEwnpEEQ0REdpZmdm8rD+JToYEpGw2PXvPS/8c
	U9DlO5SvS37Q9L46elA2m0gjUbEwTvyfQQudqL38Nw==
X-Received: by 2002:a05:6512:3b90:b0:5a0:4344:a519 with SMTP id
 2adb3069b0e04-5a33754efdamr7613901e87.4.1775692644404; Wed, 08 Apr 2026
 16:57:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Saravanan M <saravananchatgptonly@gmail.com>
Date: Thu, 9 Apr 2026 05:27:10 +0530
X-Gm-Features: AQROBzBawmxzOFcEPIsGOzTNYoxlxNoTjEDj20qfIHpmdqfUbdqrbo6pGiDL7Xk
Message-ID: <CANNcQFEFFBt7rBuaV8gwqWnbsU+fDGHaLJORq4YkkfZ9jhzAOQ@mail.gmail.com>
Subject: [PATCH] hwmon: asus-ec-sensors: Add ASUS TUF Gaming F17 FX706LI
To: eugene.shalygin@gmail.com
Cc: linux-hwmon@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000004ce8b2064efba966"

--0000000000004ce8b2064efba966
Content-Type: multipart/alternative; boundary="0000000000004ce8b0064efba964"

--0000000000004ce8b0064efba964
Content-Type: text/plain; charset="UTF-8"

Board: ASUS TUF Gaming F17 FX706LI_FX766LI (DMI: FX706LI)
Kernel: 6.17.0-20-generic
Issue: asus_ec_sensors fails with "No such device"
EC register 0x46 confirmed as fan tachometer via ec_probe monitor
WMI fan_curve_get_factory_default returns -19 (ENODEV)

--0000000000004ce8b0064efba964
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Board: ASUS TUF Gaming F17 FX706LI_FX766LI (DMI: FX706LI)<=
br>Kernel: 6.17.0-20-generic<br>Issue: asus_ec_sensors fails with &quot;No =
such device&quot;<br>EC register 0x46 confirmed as fan tachometer via ec_pr=
obe monitor<br>WMI fan_curve_get_factory_default returns -19 (ENODEV)</div>

--0000000000004ce8b0064efba964--
--0000000000004ce8b2064efba966
Content-Type: text/x-patch; charset="US-ASCII"; name="fx706li-fan-support.patch"
Content-Disposition: attachment; filename="fx706li-fan-support.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mnqpj40n0>
X-Attachment-Id: f_mnqpj40n0

LS0tIGFzdXMtZWMtc2Vuc29ycy5jLm9yaWcJMjAyNi0wNC0wOSAwNToyMDowMi44OTY1NzAyMzMg
KzA1MzAKKysrIGFzdXMtZWMtc2Vuc29ycy5jCTIwMjYtMDQtMDkgMDU6MjY6MDQuMDg5MDQyMDI0
ICswNTMwCkBAIC03NTcsNiArNzU3LDEyIEBACiAJLmZhbWlseSA9IGZhbWlseV9pbnRlbF83MDBf
c2VyaWVzLAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBlY19ib2FyZF9pbmZvIGJvYXJkX2lu
Zm9fYXN1c190dWZfZ2FtaW5nX2YxN19meDcwNmxpID0geworCS5zZW5zb3JzID0gU0VOU09SX1RF
TVBfQ1BVIHwgU0VOU09SX0ZBTl9DUFVfT1BULAorCS5tdXRleF9wYXRoID0gQUNQSV9HTE9CQUxf
TE9DS19QU0VVRE9fUEFUSCwKKwkuYWNjZXNzX21vZGUgPSBFQ19BQ0NFU1NfTU9ERV9BQ1BJLAor
fTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBlY19ib2FyZF9pbmZvIGJvYXJkX2luZm9fdHVmX2dh
bWluZ194NjcwZV9wbHVzID0gewogCS5zZW5zb3JzID0gU0VOU09SX1RFTVBfQ1BVIHwgU0VOU09S
X1RFTVBfQ1BVX1BBQ0tBR0UgfAogCQlTRU5TT1JfVEVNUF9NQiB8IFNFTlNPUl9URU1QX1ZSTSB8
CkBAIC04ODcsNiArODkzLDkgQEAKIAkJCQkJJmJvYXJkX2luZm9fdHVmX2dhbWluZ194NjcwZV9w
bHVzKSwKIAlETUlfRVhBQ1RfTUFUQ0hfQVNVU19CT0FSRF9OQU1FKCJUVUYgR0FNSU5HIFg2NzBF
LVBMVVMgV0lGSSIsCiAJCQkJCSZib2FyZF9pbmZvX3R1Zl9nYW1pbmdfeDY3MGVfcGx1cyksCisJ
RE1JX0VYQUNUX01BVENIX0FTVVNfQk9BUkRfTkFNRSgiRlg3MDZMSSIsCisJCQkJCSZib2FyZF9p
bmZvX2FzdXNfdHVmX2dhbWluZ19mMTdfZng3MDZsaSksCisKIAl7fSwKIH07CiAK
--0000000000004ce8b2064efba966--
