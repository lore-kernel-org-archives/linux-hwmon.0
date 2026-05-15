Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8FB3EF649
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 22:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778884089; cv=none; b=haQrCLLMEvB+3aIMiXBwGx9suBql+03y/yWq09381/cvRAFyzNTGy/uXWM4AVAKb/Z/C7/0jEaMHLDID900wKzGjoOEsKIGoOy1UzxomeXUCqiy7K9S6Ai8Ff07DsZjlg8e42udSd+NPwlUL9RkDl83ovbt+XjHnXVJ4PezzT1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778884089; c=relaxed/simple;
	bh=al89eVZbnkuwPfy5Xy1y378vivgklVuwjtcqJzjnvHw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fVpU3GROPUKY6NtC1Fvp+Ppro+BRRRI8fPJk6dvNYPI7nDfhT2jAIBhKMlTKYoH13vmvjtwcySc09ccaLpPHxBK5q02Of9NbdZ8UbSawbNwnIjBoZQqwzz5LXr+qtCEevtvl5IV5o+VnTU+vOS0921+FN/LRl7OBHsycaiqRJdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXXXjKLL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXXXjKLL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E97CC2BCB0;
	Fri, 15 May 2026 22:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778884088;
	bh=al89eVZbnkuwPfy5Xy1y378vivgklVuwjtcqJzjnvHw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=aXXXjKLL6kNVzzTa46hLD86lQyoScDmtcubqoXVZc+s4vY0WHc0CLQ1oSQDOSG4gA
	 VZpmsFB20bDJXeSpTSPgEmH2mZ/fIuUhW2utGxFmnn2lnVN/voRxHIhbCBoTKjkKYk
	 sZ/HR/zZXR8pONvy7RM/3p51kbDjnSm0yaKWDxK+hFRvwhFWmEAuGyhqoSckKSPamf
	 9gm5zbmlhh+0BsymTFbjlzZ0gAvK6xIqjxt/viqlStPnRWgDzoG+RCaxChtzJi0N5B
	 vwurGzOhQDnVvqAIGGvsFSBviImjeXEe4mZ0AnPNfozmfMBdEmKJLKPMi+T3iuJpEp
	 Rp5PlVsMfxkbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] hwmon: (pmbus/adm1266) seed timestamp from the
 real-time clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260515-adm1266-fixes-v1-1-1c1ea1349cfe@nexthop.ai>
References: <20260515-adm1266-fixes-v1-1-1c1ea1349cfe@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 22:28:08 +0000
Message-Id: <20260515222808.8E97CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Fetching wall-clock time during device probe yields an uninitial=
ized value, defeating the purpose of the patch.
- [Medium] Switching from monotonic time to wall-clock time introduces a Ye=
ar 2038 silent truncation bug.
--

commit a6888c73c1a25c1329fffa916ee8e1654b5eaa1a
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) seed timestamp from the real-time clock

This commit switches the adm1266 driver to use ktime_get_real_seconds()
instead of ktime_get_seconds() to seed the chip's SET_RTC register.
The intention is to provide wall-clock time for blackbox records.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index d90f8f80be8e0..a86666c73a5e9 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -432,7 +432,7 @@ static int adm1266_set_rtc(struct adm1266_data *data)
>  	char write_buf[6];
>  	int i;
> =20
> -	kt =3D ktime_get_seconds();
> +	kt =3D ktime_get_real_seconds();

Since adm1266_set_rtc() is called during device probe, will the wall-clock
time be initialized at this point?

During early boot, before the system timekeeper is synchronized with a
hardware RTC or NTP, ktime_get_real_seconds() might return a near-zero
value. Would this effectively behave like a monotonic timestamp and
silently defeat the purpose of the patch?

Additionally, does the 4-byte serialization loop in this function silently
truncate the 64-bit kt value?

drivers/hwmon/pmbus/adm1266.c:adm1266_set_rtc() {
    ...
    for (i =3D 0; i < 4; i++)
        write_buf[2 + i] =3D (kt >> (i * 8)) & 0xFF;
    ...
}

Because kt is now a wall-clock timestamp instead of system uptime, a 4-byte
field will overflow in the year 2038.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-adm1266-fi=
xes-v1-0-1c1ea1349cfe@nexthop.ai?part=3D1
