Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D368278161;
	Sat, 11 Apr 2026 20:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775940195; cv=none; b=Bp9lqWr5CyaZ9EEi+TsQupntMnY63hJjmkKt0hxyVlZlSBOmqIVVOg1aG7NfyAOZl0fPTuZyfyEUMkIcBezsyZoU6oMzcRlQTQbk3KwizOSKDvxxqt+zP7dz6nwj9YE3wUtwr4b10A7F5cT6pyvmbF6LkB+Y1jJByPTQ6yBCiQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775940195; c=relaxed/simple;
	bh=sFsYgdIx2Fo2ctXS6+wI+EUWrbgC+DQeGcKBpV6c3uI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iGZKn2rZkqStARF4318EI+GD59SrnELNbB/irynRUZ+eLFT+ldFzTurr42mfbK9YRY7fWRMixfKPdDhwEWgPgkCfkRIpgOweY6Vzu2VaVKlRSY0jIknNJ167MvjC1zbDgHCo7F5A3WCAq3otCq1+HAfRvusFvIGSrH3XqAqH4xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=DJVlqXjJ; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="DJVlqXjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1775940192; x=1776199392;
	bh=6oJp7wLFx+LxZMDfH3EA6DsY2m2FLyntyY9V/v6uKD0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DJVlqXjJpx9fbElttLMHL/L1gEL6CqYP2e/NDIk+L4dcD7OfeWxpnvnRwytQSZP4k
	 +fvSy/Ypj34m/Z2xMj7V6qI303Ce5ZWPVdZNqdiJBMPALoqOSiRi/7gN7E4EbL3LMF
	 Ll+f1hK+bNPmCBMylAqtmo0h38YwICYGRzP+WB0+XeOB3S27Bz2kFngb8fxcG4jfdj
	 GUiVXV/evKZ3VC/qFBtuMDh5Zf/49BRU0ZqEMnNOsscsYR2S1XwLJT2jchxbpNfyFg
	 NfYQTX0r04yFjD3phWCgtF+EcIKvigGoCeLtVf2/3mAeXTqTRPJu1F9S7C9fdMn0gT
	 p4fO+ft3KqQUA==
Date: Sat, 11 Apr 2026 20:43:08 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: pklotz0 <pklotz0@protonmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, Petr Klotz <pklotz0@protonmail.com>
Subject: Re: [PATCH v2] hwmon: (nct6683) Add customer ID for ASRock B650I Lightning WiFi
Message-ID: <xpOm-uphJkl6ZFkM2cntxViVIzdm9znjJzmS3T6GkZ9XJL1R2IpjjLirkclFd5pqyO56SfqcrPfF00TncGMOAfPFuzZjGByrUYSMIv-VjfA=@protonmail.com>
In-Reply-To: <20260411203953.9843-2-pklotz0@protonmail.com>
References: <20260411203953.9843-2-pklotz0@protonmail.com>
Feedback-ID: 191960931:user:proton
X-Pm-Message-ID: 794e596b0711038088b747239f2e7af4ff7d84c4
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

V2 fixes embarassing whitespace issue




sobota, 11 kwietnia 2026 21:40, pklotz0@protonmail.com <pklotz0@protonmail.=
com> napisa=C5=82(a):

> From: Petr Klotz <pklotz0@protonmail.com>
>
> This value was found on ASRock B650I Lightning WiFi with NCT6686D chip.
> Signed-off-by: Petr Klotz <pklotz0@protonmail.com>
> ---
>  drivers/hwmon/nct6683.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index 4a8380414038..0581770380cc 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -182,6 +182,7 @@ superio_exit(int ioreg)
>  #define NCT6683_CUSTOMER_ID_ASROCK3=090x1631
>  #define NCT6683_CUSTOMER_ID_ASROCK4=090x163e
>  #define NCT6683_CUSTOMER_ID_ASROCK5=090x1621
> +#define NCT6683_CUSTOMER_ID_ASROCK6=090x1633
>
>  #define NCT6683_REG_BUILD_YEAR=09=090x604
>  #define NCT6683_REG_BUILD_MONTH=09=090x605
> @@ -1245,6 +1246,8 @@ static int nct6683_probe(struct platform_device *pd=
ev)
>  =09=09break;
>  =09case NCT6683_CUSTOMER_ID_ASROCK5:
>  =09=09break;
> +=09case NCT6683_CUSTOMER_ID_ASROCK6:
> +=09=09break;
>  =09default:
>  =09=09if (!force)
>  =09=09=09return -ENODEV;
> --
> 2.53.0
>
>
