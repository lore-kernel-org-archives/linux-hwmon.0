Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A2B33EC
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770987055; cv=none; b=kZz8B3llGwg7XknIA/QzBEeXLC452l4jLV46ULgMO+bgRAzKQrBu358OTXk0mBiteH1JIE8V591nZzKL0J598BMbbIi8fZy7Owd7iBVyB6vSeqVnm7fFUonlUC8N2ijVw5P8Tgr3dKF5jJE1zhyxt4so7syVfdzIwf8BAExBg5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770987055; c=relaxed/simple;
	bh=RcnlKBAIMTEriay3ZCo95c84xOs/bq0HtgdRo6bkQNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YqgjPd5acxDzmCuJWOlgsMYibz9yVKkq9Tg6al0Z+KTRbny67it+td3rXEtVX0LE7+cWVxd/JDJ7sGDiVuqdBdjzkBcEXI3rNYJxJLRoU2vjRqqK/onuCWXps2XJZkrb6woZMNrUUMo36+PlPRDv/QAMG8+u9Ce20nOc/38o4MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXRDNGwL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXRDNGwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78DAC4AF0B
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 12:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770987054;
	bh=RcnlKBAIMTEriay3ZCo95c84xOs/bq0HtgdRo6bkQNk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IXRDNGwLoHMIdkMwawoTNn5YJ4nAJgrvqP/uMG42NlBYR5kh29tKLRsRcYyxXDCfE
	 ZGkoOnwZgKxMahzDii/DRdg7Wci1cEA0BLp/vrqcZw5qU8CWTwmDjlNIfVQAeA9Z4g
	 py3k8PZSULHqtC73zc5nkAvuyB2cu6V4HWxsxog76a64WSaZiF7p4PXP8fo/LrPLuY
	 ijHXN3DWOPg3VbsXeYej4wdaLTy/s3FcuwQAidAp8qsBlJG/NPSqJVjqzysl5Wn7c5
	 Ip4KhYcGhjwaPtfDH5x8CfNy3K42V5e9fw4fOW6pCieRu6Z22eG60bh65AKjJcwzxg
	 jJ6j+QL+PyIKg==
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d1890f5cafso322901a34.1
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 04:50:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9LhbX9SDga2dN3pgqfgWb2Y7aeXwv3aqJMCPx1wZK8/Em5D+JaY1Wl8uG/Ls/+zTTKmJZZ7reqQlicQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyom5RgOKGKjvSm2dYoHXStQTmsIA2/tltjzmxGLcjatWoqmj0E
	cQZpet43BQnry+BUar/COGNLht40jfB8ZsKUIJlBhhfex3sVpwq/cZHgDjNmWzK4bhjSzzCT+oA
	tcvj6f4roSdS+NY9B4DX6jeMsiKDqN9Q=
X-Received: by 2002:a4a:e84b:0:b0:662:c8be:573 with SMTP id
 006d021491bc7-677697878a4mr670627eaf.61.1770987053886; Fri, 13 Feb 2026
 04:50:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213065351.915707-1-corey@minyard.net> <20260213065351.915707-2-corey@minyard.net>
In-Reply-To: <20260213065351.915707-2-corey@minyard.net>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 13 Feb 2026 13:50:42 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hO=2-6fF5NzgXmuNDDFszKizMa9wFoxZQmCT0k-e6_9Q@mail.gmail.com>
X-Gm-Features: AZwV_QjCLJjvhgY2ZE92RvQiCYya7ewxlvWFxkjsayVw5RK0UMgJp6xRBTDMuz4
Message-ID: <CAJZ5v0hO=2-6fF5NzgXmuNDDFszKizMa9wFoxZQmCT0k-e6_9Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] ipmi:si: Don't block module unload if the BMC is
 messed up
To: Corey Minyard <corey@minyard.net>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>, 
	Guenter Roeck <linux@roeck-us.net>, Igor Raits <igor@gooddata.com>, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Daniel Secik <daniel.secik@gooddata.com>, 
	Zdenek Pesek <zdenek.pesek@gooddata.com>, Jiri Jurica <jiri.jurica@gooddata.com>, 
	Huisong Li <lihuisong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 7:55=E2=80=AFAM Corey Minyard <corey@minyard.net> w=
rote:
>
> If the BMC is in a bad state, don't bother waiting for queues messages
> since there can't be any.  Otherwise the unload is blocked until the
> BMC is back in a good state.
>
> Reported-by: Rafael J. Wysocki <rafael@kernel.org>
> Fixes: bc3a9d217755 ("ipmi:si: Gracefully handle if the BMC is non-functi=
onal")
> Signed-off-by: Corey Minyard <corey@minyard.net>

I have missed this case, but indeed it needs to be addressed.

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/char/ipmi/ipmi_si_intf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si=
_intf.c
> index 0049e3792ba1..3667033fcc51 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -2234,7 +2234,8 @@ static void wait_msg_processed(struct smi_info *smi=
_info)
>         unsigned long jiffies_now;
>         long time_diff;
>
> -       while (smi_info->curr_msg || (smi_info->si_state !=3D SI_NORMAL))=
 {
> +       while (smi_info->si_state !=3D SI_HOSED &&
> +                   (smi_info->curr_msg || (smi_info->si_state !=3D SI_NO=
RMAL))) {
>                 jiffies_now =3D jiffies;
>                 time_diff =3D (((long)jiffies_now - (long)smi_info->last_=
timeout_jiffies)
>                      * SI_USEC_PER_JIFFY);
> --
