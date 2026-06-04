Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B670390218
	for <linux-hwmon@vger.kernel.org>; Thu,  4 Jun 2026 16:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780591953; cv=none; b=HJis4GWWAXxCJIdgOUCzIlVsOgPzohflIsyeN2rZ9QG3Q7nf5+WZdnM96hyns16VhcBg3Bqppd8xDGul/DnHmWJaTqNTNEcCHYvTTtrHL7pVpVJsChiKE7Vb8NGbtr/amN25DvaeHn1h4ZzO7DCQ2yLyPNFtCJ4ZsRbjM0/mBI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780591953; c=relaxed/simple;
	bh=OmCzjUB/xrCJHnHMajlVNjWQPJ3So0f7BajNLZfkQ2w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QXu2fs9LDzZqVvbQwDhu0ovQRm3wcsgAVgIGPujSQkNTb+/0CcqKXjNGzbHdMOIMtm4T4bYjWsBCW0CUqv1+CrnpXkliql81qIFlEPbOhf94FJZH2tv6VtH1QCkf/O9BjJXFVL6lBKTYvmOXY+dICLkhRggho584vzkPj5AesLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBORo7BK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBORo7BK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A301F00893;
	Thu,  4 Jun 2026 16:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780591952;
	bh=CofJh5JvOgaFWwFJE7kiSsRBbI9wfAAyeoffWPIQZ1A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LBORo7BK6NqdF2ThnG53vBSOOZrFRNmEBkFc0vUKBZ1E7Jipx0ZUxdZ+ISj/bW8XP
	 UrJaiq2ZP3M5FNiSDlinuQSjaeHLfTL6oENqyliJnkjZX/spJfq1LmjhpgwvQAa+KX
	 W3t+rXrPhb7vAHUNdjm2f+D4OEkxyaCDojmVOi3vOY5OURlN1B/UB95BKaVsa7f66W
	 QqInnld8LtEmiXgJ+zhWfGvLV9lFFK/ijI16IoZkD9eArfDwYwyggu8IBU6CgGx0sa
	 woRyWpRxvVssoAoRBwl5djWjKY0r4bAfxbJySkRHI27b37aTmzaCXr8UPSeFONOtCT
	 fd9hm2WaEn6Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v01] mailbox/pcc.c: ignore errors on type 4 channels.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Young" <admiyo@os.amperecomputing.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260604163306.160017-1-admiyo@os.amperecomputing.com>
References: <20260604163306.160017-1-admiyo@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 16:52:31 +0000
Message-Id: <20260604165232.36A301F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix for Type 4 slave channels leaves a probe-time failu=
re when the Error Status Register is properly zeroed by firmware.
- [High] Out-of-bounds read and memory corruption when parsing ACPI PCCT Ty=
pe 5 channels.
--

commit 682ec44d669bd318031fe1a1eb86dca6cabd5735
Author: Adam Young <admiyo@os.amperecomputing.com>

mailbox/pcc.c: ignore errors on type 4 channels.

The ACPI spec states that the Error status register is ignored by the
OSPM on slave channels (Type 4). This commit skips checking and
clearing errors for ACPI_PCCT_TYPE_EXT_PCC_SLAVE_SUBSPACE.

Link: https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/14_Platform_Communicati=
ons_Channel/Platform_Comm_Channel.html#hw-registers-based-communications-su=
bspace-structure-type-5

[Severity: High]
This is a pre-existing issue, but does the driver handle Type 5 channels
safely here?

In pcc_parse_subspace_db_reg() and pcc_parse_subspace_shmem(), channels
with types greater than ACPI_PCCT_TYPE_HW_REDUCED_SUBSPACE_TYPE2 are
unconditionally cast to the Type 3/4 struct:

drivers/mailbox/pcc.c:pcc_parse_subspace_db_reg() {
        ...
        } else {
                struct acpi_pcct_ext_pcc_master *pcct_ext;

                pcct_ext =3D (struct acpi_pcct_ext_pcc_master *)pcct_entry;
        ...
}

The Type 5 structure (struct acpi_pcct_hw_reg) is 96 bytes long, while
the Type 3/4 struct is 164 bytes.

Can casting a Type 5 entry to the Type 3/4 structure cause the driver to
read misaligned garbage memory past the end of the Type 5 structure into
the next ACPI table? Could this populate GAS structures with arbitrary
data, leading pcc_chan_reg_init() to potentially map incorrect physical
addresses via acpi_os_ioremap(), and misread the shmem base_address and
length due to offset mismatches?

> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index 636879ae1db76..0deaf7907ed66 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
> @@ -270,6 +270,9 @@ static int pcc_mbox_error_check_and_clear(struct pcc_=
chan_info *pchan)
>  	u64 val;
>  	int ret;
> =20
> +	if (pchan->type =3D=3D ACPI_PCCT_TYPE_EXT_PCC_SLAVE_SUBSPACE)
> +		return 0;
> +

[Severity: High]
This is a pre-existing issue, but does this fix need to be applied to
the probe path as well?

While this skips reading the Error Status Register at runtime,
pcc_parse_subspace_db_reg() still unconditionally parses and initializes
it for Type 4 channels:

drivers/mailbox/pcc.c:pcc_parse_subspace_db_reg() {
        ...
        ret =3D pcc_chan_reg_init(&pchan->error,
                                &pcct_ext->error_status_register,
        ...
}

If compliant firmware provides a zero-filled Generic Address Structure
(GAS) for this ignored field (evaluating to System Memory with space_id
=3D=3D 0 and bit_width =3D=3D 0), pcc_chan_reg_init() will fail its validat=
ion:

drivers/mailbox/pcc.c:pcc_chan_reg_init() {
        ...
        if (gas->space_id =3D=3D ACPI_ADR_SPACE_SYSTEM_MEMORY) {
                if (!(gas->bit_width >=3D 8 && gas->bit_width <=3D 64 &&
                      is_power_of_2(gas->bit_width))) {
                        pr_err("Error: Cannot access register of %u bit wid=
th",
                               gas->bit_width);
                        return -EFAULT;
                }
        ...
}

Will this abort the mailbox controller initialization and leave the
channel unusable?

>  	ret =3D pcc_chan_reg_read(&pchan->error, &val);
>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604163306.1600=
17-1-admiyo@os.amperecomputing.com?part=3D1
