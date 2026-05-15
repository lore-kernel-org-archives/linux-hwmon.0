Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8561DED5C
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 22:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778884774; cv=none; b=L7a13VbsCi9uoekCrbwbHOtS3BLtiXlqqk1e60gLoX6Y461R0N3OU/faWOzqKWZOCLK7DCNSusRk4npoAwvvjpm5az2gFrDxr9161KcEyVdp2nRmoJ3p3ZsV5YeiZ1NNKb3PKWQcEMoavkog+8R+KBiPTCmT646HFskSdePZHSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778884774; c=relaxed/simple;
	bh=aBy0TjaurMnLZOAMBsfy1jo4X01KwcwsMEXDaSYwF+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z+UhkAkwwTrNEMxh71Q5hT+N6TAQLcc1UT1oR1lfI1yOAP3c7UBU+4v/VHEJCj40EuQ8I0GRFAtEITAd3uD7ombTGT4vTPx2/t4FWYroTvx/ae1QmwmCje94wIDoGJhX7k2Lz5zBqhBl4ua6UaVn8oOiGEbrQl/lTiUa8FlyZFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORcsCdyL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORcsCdyL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134C3C2BCB0;
	Fri, 15 May 2026 22:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778884774;
	bh=aBy0TjaurMnLZOAMBsfy1jo4X01KwcwsMEXDaSYwF+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ORcsCdyLhCHNCWTTr5+fBp/SALdm1IH3WKGU4QGCEDU0N58wJTBcP5QOwXLP5imYP
	 nuzdcwN+ULEEQHsJoihbQbMuOSH0F0teioWGbfRYjmsGsGUan3oXU0hScxLnhNkw2b
	 XJnfzoQjVOfARCSoF+H3ZWU6vH/Htlpm/GwfLtiTPzPLiNh8p1AMRSDk8M0s8BBjC1
	 tiAOgwlcHKhuCCJ4t8K/4xBNjvn3892m2d/0m1z5gRpd5SvlhTN1V1lsnOddIXOQ+j
	 07rqYFlsFY+LfnIMHUDs36He3kMdANZQTFlNosa3XZPizdw4f62Sp8DA48/7em/ez7
	 iOM6Skq+7PDgw==
From: sashiko-bot@kernel.org
Subject: Re: [ v01] mailbox: pcc: report errors for PCC clients
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Young" <admiyo@os.amperecomputing.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260515221745.714736-1-admiyo@os.amperecomputing.com>
References: <20260515221745.714736-1-admiyo@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 22:39:33 +0000
Message-Id: <20260515223934.134C3C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The error path fails to clear the `pchan->chan_in_use` flag, leadi=
ng to state machine corruption and spurious client callbacks.
- [High] The error path fails to acknowledge Slave Subspace notifications, =
which can permanently hang the channel.
- [High] The interrupt handler incorrectly returns `IRQ_NONE` after success=
fully handling a mailbox error condition, risking the disablement of the sh=
ared IRQ line.
--

commit 8be35a18843a43d39fee5986fb5339b3f4e55c68
Author: Adam Young <admiyo@os.amperecomputing.com>

mailbox: pcc: report errors for PCC clients

This commit updates the PCC mailbox interrupt handler to pass the error code
to the tx_done callback via mbox_chan_txdone() when a channel error is
detected. This allows several clients to accurately report these errors.

> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
[ ... ]
> @@ -327,8 +328,11 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>  	if (!pcc_mbox_cmd_complete_check(pchan))
>  		return IRQ_NONE;
> =20
> -	if (pcc_mbox_error_check_and_clear(pchan))
> +	rc =3D pcc_mbox_error_check_and_clear(pchan);
> +	if (rc) {
> +		mbox_chan_txdone(chan, rc);
>  		return IRQ_NONE;

Since the early return is taken when an error occurs, does this code need to
clear pchan->chan_in_use? If it remains true while the channel is idle, cou=
ld
the next interrupt on a shared IRQ line bypass the !pchan->chan_in_use filt=
er,
incorrectly evaluate cmd_complete as true, and spuriously call
mbox_chan_received_data() with phantom data?

Also, for PCC Slave Subspaces, the platform sends asynchronous notifications
that must be acknowledged. By returning early, this path skips calling
pcc_chan_acknowledge(pchan). Can this leave the command unacknowledged and
hang the Slave Subspace if the platform stops sending notifications?

Finally, since pcc_mbox_error_check_and_clear() clears the hardware error
register, it confirms the device legitimately generated the interrupt. Does
returning IRQ_NONE here risk having the kernel's spurious interrupt detector
eventually disable the shared IRQ line if this error path is triggered
repeatedly?

> +	}
> =20
>  	/*
>  	 * Clear this flag after updating interrupt ack register and just

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515221745.7147=
36-1-admiyo@os.amperecomputing.com?part=3D1
