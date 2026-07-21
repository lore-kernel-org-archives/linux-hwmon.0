Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC333FF1B9
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 02:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784599986; cv=pass; b=kRyRmzMrl/zd4Rj2GVAc6y7/8LAKzgN8vMRPFRam3bKUPNybUeHCKGp0WKOIcqk2nSoqk9FIWKA/bKwgD69e5XXMAJT6Nvhl+Ck1RN43lraWUTvmBbnzsQFU4+oAFAk3bH6EuR4KTxIJhEEWjRgaFeIFXSLGooYQiV6rE/OUIQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784599986; c=relaxed/simple;
	bh=Ks4hlPwjiSSqgNz3Ei+KPrG/m6doz7SbHxytNQOm61g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKQYge6t94EF0tqgYFSwGn1w6OIt+tiwUr51dLagtb4LErDLUnHL3gHNYko+zC8pCo6snB4FTCFIoK8fonIjoXabfhtKaNJPm4VaIAcMjzq/13qcemBMM2RXY5VG24OTy0CLNGd7F8C+iFcQ6TmDsFEZD8v4G0SEO/3tzCRtW/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZLPxgzY; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZLPxgzY"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c16794450aeso750226466b.2
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 19:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784599983; cv=none;
        d=google.com; s=arc-20260327;
        b=YkhOcLRfmxgtTyFEahVeiO1dCNU7c0Y0ndp+jz39GQz1ZajCnr5u7Yo8dPYMDMjsoO
         1lY4eIEnmJVBwNvWuErahx747DshD2Df6m3ro2XWXek9BpPFFvdr3nNmzjzA8aCoXwD+
         EFC7BhneFKyDW2eyaF6zBZc598flQ/i6Pqe60JXjtOadXSDL/tS5iMTV9n0AzJTSKX5t
         /wVxE8FROuIWmg9dIX4oXztKnVoGJZmH4GI3hsdpjVv2XnetqVRFDiPnvTsW87Bktvm3
         7jK93mPFavjpMc3KuHpcBqD4GKtP9FxUm0rKFstiTtWjTrFnefgvAzAm4CA8r6riU0Yx
         aimQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Kod/uxXV0+IwWSdU1EXXNkwfBulsiSvEkeGxFmls+yM=;
        fh=jyerBu8l1LfC/3TqlbrVRKCDZDcaQuHpR6KSBTT2eYU=;
        b=eEZaE9/E5B8pqj4lw+D5f9DyIl9FjYtwVwp5rjYZlASUODqi8s4asd8Q/DV9wM5c2v
         1Ige0sQUzmCjurVvqsgOgoNFirt71Whczkn9AGtOywllA5NPjM/BbV8RtbIsjijjWJMA
         a33ivCQrehWZNiw3IM4lUtVm9lQ+HTDD3AONAcWCECnwWMEwTrCvuNco2BIpqPOrayAR
         VXG8IluPWGYalNTJ5fDEimgx36bj+D94iL+GyCnlfDbVxMCj3cwnD8jLTacnzYDj37qI
         M3VhEI+7BPH/L6zv8DYXAafx2mfzM9RebMQj0fPf4wmv7FMFQH+t7A5PaP4HUptfkvwg
         GQbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784599983; x=1785204783; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kod/uxXV0+IwWSdU1EXXNkwfBulsiSvEkeGxFmls+yM=;
        b=hZLPxgzYAY10fGqW7FAPnvqZTmPAZjzeZoiDPT5m8bIvk3AsHKGZarLV4vz5RrNWs5
         zoIj+uHLuf25n69oZ8YLcfIIxmrL1Dr38yzy8dgPE/b8RtfC18PWfLL72tcJphOA+lSP
         Uu4ULlWicgxAeVMzAQ/NlEfQKVkvhWrB+lQgdtGt60y43fKliA12IQyht/O6UsGIFJrJ
         lCM+T6GCsRWy6NIGDRyIClyUSsZ1HFOR99oLNoGxhEilX1CZDdHnWflv5Qwb1omykbc9
         1PAUMPJ6NLKgRScMvAiByJ7pWco94gLs+4nZ/ZXMFi/3fIgB9jGvW4zz0uhMbyjxw1HJ
         tOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784599983; x=1785204783;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kod/uxXV0+IwWSdU1EXXNkwfBulsiSvEkeGxFmls+yM=;
        b=dLZiKSKSTgAUnhzkMwXFMSTyU1QNDLCSg88LCO1bv6CyRzQH806/tXbeLLLN63Zm3T
         e3KddoxESe5BwRs3dL9twnpmxp7SZlWqSb8KImx40BuhGMTvT4yBulXepaO5ITjc0RPt
         NfRjmLHCKB+qs3dMTi6pGzZlXSCGEXboaT6WJtR3ZMIeSs0k443nWzzTu4wZPuFZrOdU
         p6NKczRS7Huy7DvULbh4LkOHS6CKX2OukkFa0UCpOXhjShDfwirj/WYXK1l68oh9DFDo
         REonqJm5pL+0J0JQyYpXVzGzWZ1lc1EmOWLUeEcvVXI54CilZ9QlZa6aJyKVFN4beh8c
         ukuw==
X-Forwarded-Encrypted: i=1; AHgh+Rrw6IiAM4hh5VZXRaJBIiUZFoqpQRTW7kiKwsIq9tVi63+mam5R3u88TVttBNNMKEctxzio/Eyc2NDn2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ZXzFRssYnk6W74DpAHSpYJipebogSkwh9HJ/vog3floN0XWC
	DfYPj7SL3zBpa/5IExTDQBXfKkNmhdXtm+VKJ5bkAtQJ7ELC4ZfgShyCkf6Zhlie/atoyBrLFPv
	PRBRmR1/Rx32Xu0gORFhHGqgGTRER6lA=
X-Gm-Gg: AfdE7cnhfem4xZDJemfOllb2JBZgoQOMUMnjs/P0U3XB9inmLG5ZvJacpDESROSuiRe
	2w7leVDyBbvKZlW1Cl+08vgEyRlbGfblMGsLmRigu3WJaFJK2CoAyI+qNLzxU5CMOYFrM85tXqO
	9EruvOQrQn3EU0r2hxWjvuosYhXncVhibZcj7k80NZCT37bI2XU8vSv0QwCrWqIPV4o2k08LJ+e
	4DvcZGkvz0l/zIoVQFdfJXSTR8/zs9NTxEz/0Bsj1yyqawkrW26XW69CbPTXa/yZEKA2gIvFVE0
	e1/Z4N9+78a0mIJ/5gE=
X-Received: by 2002:a17:906:9f84:b0:c15:ee0d:9a32 with SMTP id
 a640c23a62f3a-c16b46c2d56mr670202466b.21.1784599982941; Mon, 20 Jul 2026
 19:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-1-a55147958fad@gmail.com>
 <20260720-placid-fanatic-shrimp-d2bcd2@quoll> <a8fba49c-bb72-4b3b-b598-4972304e0b4c@roeck-us.net>
In-Reply-To: <a8fba49c-bb72-4b3b-b598-4972304e0b4c@roeck-us.net>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 20 Jul 2026 23:12:49 -0300
X-Gm-Features: AUfX_myLShn4fOD2j01TxsjJLkkvEv0DLVF494Hq8Z0mAimraTmy0Vm02ScO--c
Message-ID: <CAJq09z6qQnKXgBnQKCey4u47hsJTjpYXPDvDZj76sXHZuj2emQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add binding for adi,adt7470
To: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>  From the datasheet: "The ADT74701 controller is a multichannel
> temperature sensor and PWM fan controller and fan speed monitor".
>
> It is a fan controller which happens to use pwm signals to control
> fan speeds. It is not a PWM controller, and its pwm outputs are not
> intended to be used for anything but controlling fan speeds.
>
> Technically it is _possible_ to use the pwm outputs to control
> something else. But that does not mean that chip is a pwm controller.
> It is still a fan controller. I don't mind modeling outputs as
> non-fan-control pwm channels if that is what they are used for,
> but that must be clearly distinguished in both the driver code
> and the bindings.

Hi Guenter,

You are absolutely right. The datasheet explicitly defines the ADT7470
as a "PWM fan controller and fan speed monitor," and its internal
features (like tachometer inputs and thermal acoustic enhancement) are
heavily tailored for fan control. I agree that calling it a generic
PWM controller is technically inaccurate. I will revert the change and
describe it as a PWM Fan Controller, provided everyone is on board
with that.

Initially, I modeled the driver purely as a cooling device. However,
following Sashiko-dev's suggestion in a previous review, I converted
it to expose PWM channels so it could be used with the generic pwm-fan
driver (which indeed makes the code cleaner). My primary experience is
with DSA switches, so hwmon is a new area for me.

Whatever you and the DT maintainers agree on, I will gladly adjust for v3.

Best regards,

Luiz
