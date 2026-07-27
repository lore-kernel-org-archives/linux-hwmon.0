Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CDB3C060F
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 18:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177867; cv=pass; b=mTuzT37kB1RyJYi8lvIt6+nc7hx8SZe0Wth0O1idhZ08kbZjzNkxDyogwnltCoz9d/r0dMS15XNNhwZ6OvACNcl/ZD97IWID8UpEztbbMM0TR5jHZIP40FeETkAPSaL9oactMiLCbur+Askufb+4CcSgbMi3cvlLuXK9W54jNhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177867; c=relaxed/simple;
	bh=B9EcOR+BZOwT2HYLIhcxDcHwBx79GxDVCjFOT229ugo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ffkyfzkp0liG24HvC8dblQAUjBEypLmpj1U+Mijg0jcAukemnOBrp7Y7SZg8JkexQ9kCI8hcsrgYumH/ipsTQ6liuexF2fD78xu7FA3XhtkVzgl8XzykDQPGQRAhB5E0Iwdu5qxv+J+vbzFxvh6Pv7n1sDx6xgX32u2ozUNu6lM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJ1ymiZm; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJ1ymiZm"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c169ae1cb26so33791066b.1
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 11:44:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785177865; cv=none;
        d=google.com; s=arc-20260327;
        b=eO0+fS+C4z+5k1PxJo+XfNNm5nPrxPntnjZMSNXa57FgvvPDFqCcA2yFm6oGk03iJa
         e4eBL2G9YBtWU9mwtQiVH/Ze322Qg6+wBbyuR0BX95pAauk8/lswRB4kUH3FQUYR2dYN
         meVlwL+DzuVhScTY9oVWZWKSpYv1i5nibx2oMuJIJ+yHKZaEeYNx3yW95zRvGJfctkJq
         2+B+l98ncEQNbl2HHPSw+wMObNSFJTLNeD1HVC351BBMe7s5dDuK8MktLNoVSQDUHa8n
         deuvv9Imq/NyxLAHTpWbZk8hObgwJ7Hnp+144v1EgP/RpQ/ed/XlsGF93FZN1WZltV+u
         dqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B9EcOR+BZOwT2HYLIhcxDcHwBx79GxDVCjFOT229ugo=;
        fh=3djJELhG0D6BbMUcFNoOu+JYb90qdf61kmtYcaypKbY=;
        b=KFYBY7vUdNgoDR4XnJ3oXv6p5+2l/DXGtSSuCw9ajjlPC/5H0OP5JENBl7GR6p2EQE
         z66/2L4uc08+vh4Scups5jrI3avbMIhTxhJ54nnSr25jopHOxWN15MZF6HRy0YdX1QpU
         nrBTGuNCdkxa9fW1CrPtf2MUPClf9kWheOwUrZDH2rcktvdRE7Wvu1ctl1bMkMx9iFSA
         EVeu3Y4K37OoEAeOcDtHWoysJs+ri1a4tlHBidaSeulxAOHtQcce3ce1EfwlOXDkqIAF
         hOGwTbxJhXV/pmR026bMjL6v1L1h4aamQNJpreSm2NAooaoxdrQgHzne8YBlkg4SORRw
         GgrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785177865; x=1785782665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B9EcOR+BZOwT2HYLIhcxDcHwBx79GxDVCjFOT229ugo=;
        b=ZJ1ymiZmQY/wTZxige/8RtuM36CUyBLDW56dGwhtUPzrixtnR0qvt41+w3WXETBFrJ
         8B7WnFeP7ZE/557XV2WR7p8EevHlF2UxDwPXH7GMojUM6VoEBfwXj+Dh7kqxbHD4dDCS
         xFa22l3vgA3KalaKjL4R5eLivEVxVKEkSDNPMML4fLHSaDhZPbT+HtUtxUUPD+yC5UPP
         Y0n2Xj5JRvekOY28cTsDfgOQ6oPfUYA6JXQAqTtSLABtqDSphbUe9ObI1IU8dSyNZtB/
         zYmX7gR8GpWeS+Mi+xiRsFmok0hFhgfoBTuCHcTx9NNbYaZnhWSPefNrQK+b0lKVlwwM
         tCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785177865; x=1785782665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9EcOR+BZOwT2HYLIhcxDcHwBx79GxDVCjFOT229ugo=;
        b=mf/1EvTyGDbTDb/ZGG8oeC8+CEJgqSkQ78sA+39RFUFSeykkO4n6tG8LKl8FFlsKQi
         FU7WNSiYjAHV//2p6WoclETcbkgSriFKW/4uQ3VkSb35O/tBSB/hgje4LuGohdZHiGIz
         8joO86fEr2IDK5aDMN8/HwFnBVvu9EafilU0vzTj+pXkJTuZl3WjJ2UJUy05iRLzetIF
         5ULZq3bFKsDFwRi1VvwAzv19CKgQ/LNsPr2/pYFbjblp3rWVoSGWFFZhssqe2SgbG8kc
         AtCdCGh4/T80b3nQFUXQ9jPVv0xvUuJPnqWQ1TSralnpBb/Wcxo+9z2dDHrv8VKjuP6S
         r8Zw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8qh/d16OhgFKI8z/PsNkAsWaRPsmfoEx3pJVz8x7364wrNJorX7f89/8OfVJjWeHWrjhEBiPNQ/kPhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAAKJzQVqV+4nV3hAYJgRgRz2g3J5v/A6olI+3AGZrPdHm9Hqk
	U11XXjOB8WBKjuWmFyz2KrfonzdNWhgEXEJquD7GF5vudNzlf2UtVVcHZmaCvTOu4PEoMSFg0Dk
	9fg4HWGKEDpr2u3k/+618VA6UU/Bh09M=
X-Gm-Gg: AR+sD13ZGCFAOTY5Qv7d4wxHDmuCiinrCWQuLi3cFpzYncU56B1LS22XsfTftAvxNcl
	nWiJP4v2DibySWy3Jri50qHlRMRpMbuLqozRsvrAJ6WNF8xZe5humwz0F1yEqRwLCt7XkTtjVih
	bTNvzWqPP8A3zbtmXNxCGCn2HXWfXnQTWWyftPZcbf8VnuWGUgv3n9jAKguNdpOHIj2FwMdZfFw
	aGLcXWCjtkqKF1Xltp/AHUGSAU/5LhpCyl2bDKckG/5QKaf3/xRwnB6DjvyngwhPyCp2DWqcbVU
	laJnXeAc68+Qo0Bi1iY=
X-Received: by 2002:a17:907:c78b:b0:c12:cb91:58aa with SMTP id
 a640c23a62f3a-c1f67aba13dmr29003666b.24.1785177864590; Mon, 27 Jul 2026
 11:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-6-21424d550c3d@gmail.com> <f15dd16d-0e3c-4d7a-a8db-59ca3d34d4dd@roeck-us.net>
In-Reply-To: <f15dd16d-0e3c-4d7a-a8db-59ca3d34d4dd@roeck-us.net>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 15:44:12 -0300
X-Gm-Features: AUfX_mwWu8GpF1DcEHjtVKDlspUggaY5ItHc363M-QikzLa-Ec76GLJ0CzIW6Tc
Message-ID: <CAJq09z57AMTFyEnvbHw=-6KDC83sA+E944=WcNc=FjzFySAmzw@mail.gmail.com>
Subject: Re: [hwmon PATCH v3 6/6] hwmon: (adt7470) Use cached PWM frequency value
To: Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	"Mark M. Hoffman" <mhoffman@lightlink.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 27 de jul. de 2026 =C3=A0s 11:33, Guenter Roeck
<linux@roeck-us.net> escreveu:
>
> On 7/26/26 20:34, Luiz Angelo Daros de Luca wrote:
> > adt7470_pwm_read() currently ignores failures returned by
> > pwm1_freq_get(). If the register read fails, the negative error code is
> > returned through *val while the function itself reports success,
> > potentially exposing a negative PWM frequency through sysfs.
> >
> > Fix this by using the cached PWM frequency maintained by the driver,
> > eliminating the register access from the read path.
> >
> > Apart from the corrected error propagation and using the cached value,
> > no functional change is intended.
> >
>
> An alternative might be to use regmap for caching and drop all driver-int=
ernal
> caching. I have done that for other drivers; typically it simplifies the =
code,
> sometimes significantly, since the update_device() function is no longer =
needed.
> Something to consider for later, maybe.

That definitely sounds like a nice upgrade to consider!

I haven't used regmap's caching feature before, so I'm not entirely
sure how cache expiration is typically handled. In adt7470, caching is
mainly used for volatile readings because hardware access over
SMBus/I2C is quite slow. On my device (which might be an extreme
case), reading all registers can take over a second.

What would be the recommended strategy here? Would it be caching all
registers and periodically calling regcache_drop_region() (or mark
them volatile) to force a refresh?

Regards,

Luiz
