Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E242A3AA1B8
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783861944; cv=none; b=RsfOc5zqAjm3dfLRgKGFrCEMhFjaa/xwdnDkECewtUPzO3jhqwdayX3yz2ToN8aA/PTPaeXzzenOrnYCghl5/AMAxjgmrGtzYFwLjBdVvWE5OUqt8IjdQg3riep/Mvv29JHQlF0YL4J9HDaAwR+2TUZcL/ORf3hA/QWtsTGrbv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783861944; c=relaxed/simple;
	bh=jAlzToAPreNVoPYaC7wKUXrnDtv4Bk5atWbVljCXpsw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XEC1F2cAoaKWIAFL1gcZ7nhliGfy9IxFDM9zU2O9goo0XjwC/14oVqOCaTD0ISaB1il+hkFwRcU+WGdwWopI1AtwTSGfN+3WwL2bmaqPeMupOD5MdIs8TY0yqkm5AG+y4riAAX+WTqf8JQ4NZpo29BsanljbGfITRxd2rOpBnS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFpio+t0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFpio+t0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF571F000E9;
	Sun, 12 Jul 2026 13:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783861942;
	bh=y1D6tDHIiEjFyXURF09lH71oQQSiGn6CRODdJlezE2g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IFpio+t0fp7Py5cKqTcOXI0QpkbfxyM0lc4zWq5U7HZrPZb1FFTw6ykdSY785gt28
	 YdNOevFPHAuWzZLrmpRvz9HnwyRzx8jKnIr3BrCmBnUiXu/q1mOEiBd7VOan+dHFd7
	 gbVtFknEvu7SBiBEFVUo/xNJ0PbV9xcUF7BKMHB/zwVAweGgAKbThgcpFzb5FYF/aS
	 ue95V4vDCW1kXClcdDlfEk9Ew8o8w/OLX0UoLtQL6E80ElccOikyjQTUjL+ZKMoaSl
	 d2vOYo4s5KNJgQZfYjrRT3FIYW21gOL0KZLJ6uao3up+sVTERMaSsz9haIPYw3Rb4c
	 xyqBcHtt2V25g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: (asus-ec-sensors) add missed handle for
 ENOMEM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260712130345.1256030-2-eugene.shalygin@gmail.com>
References: <20260712130345.1256030-1-eugene.shalygin@gmail.com>
 <20260712130345.1256030-2-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 13:12:21 +0000
Message-Id: <20260712131222.5BF571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Spurious out-of-bank EC register reads due to incorrect filtering =
condition in asus_ec_block_read().
--

--- Patch [1]: [PATCH v2 1/1] hwmon: (asus-ec-sensors) add missed handle fo=
r ENOMEM ---
commit 6c544c8bc415253dbbfc446299b7748bcc5d2a83
Author: Eugene Shalygin <eugene.shalygin@gmail.com>

hwmon: (asus-ec-sensors) add missed handle for ENOMEM

Add missing return value check in the setup function.

> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sens=
ors.c
> index 29a23484cbe7b..fc58b7eb413ee 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential
issue in asus_ec_block_read() while reviewing this driver.

drivers/hwmon/asus-ec-sensors.c:asus_ec_block_read() {
[ ... ]
	for (ibank =3D 0; ibank < ec->nr_banks; ibank++) {
		if (bank !=3D ec->banks[ibank]) {
			bank =3D ec->banks[ibank];
[ ... ]
		}
		for (ireg =3D 0; ireg < ec->nr_registers; ireg++) {
			reg_bank =3D register_bank(ec->registers[ireg]);
			if (reg_bank < bank) {
				continue;
			}
			ec_read(register_index(ec->registers[ireg]),
				ec->read_buffer + ireg);
		}
	}
[ ... ]
}

Since the inner loop only skips registers from previously read banks
(reg_bank < bank), does this code mistakenly read registers intended
for future banks (where reg_bank > bank) while the hardware EC is still
switched to the current bank?

For example, if the hardware EC is switched to bank 0, would it incorrectly
read registers intended for bank 1, 2, etc., from the bank 0 hardware
interface?

Could reading arbitrary Embedded Controller registers without being in the
correct bank trigger clear-on-read side effects, disrupt state machines,
or lock up the EC?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712130345.1256=
030-2-eugene.shalygin@gmail.com?part=3D1
