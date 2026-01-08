Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CD93BC4DF
	for <linux-hwmon@vger.kernel.org>; Thu,  8 Jan 2026 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863882; cv=none; b=d1RIj2ipI71Qtiil9MmUN3+Z+ygskDTJKxEmcPmRL3JbcqxMgKcvbzr7CkhmDmvOzpMnoINhaDbol2Xgbi0hy2FUvIkLvDlIgkEwboLysvULA8L6pu/odIaEKAIzgjCsjfcWC9ZD1rZDtp4rOVDGC2yHiLRVDLQMpQbkMx5CXjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863882; c=relaxed/simple;
	bh=rJKlSCF9OU05jcuov22wvWuBsucLoLxar7+T5KXFJ4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSWEzZoAUNud2jqmemktdcXdoGHyEHhGvF0kB3lbf7UVjys3vms+8CGn42WbnkVlJOqdYVavZs8AAlcLIHWvkDDM5zQ+YG1Jk8N2Ut7q3mj/8AFX3xw3qp0301BoEHEFbPhDpVK6RhKHtG4UfKfUMW5ju+v8iHzW7K6Zp1P17No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAujPoXa; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAujPoXa"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b04fcfc0daso2626064eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Jan 2026 01:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767863869; x=1768468669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eis8NHZnE9ri0RzqLaxUqcXpiZJ26AU6MwmGkm8dkog=;
        b=kAujPoXapPgEDlqfiuC4dX0e2G8neTDWMNSNpvesLx8K3SFFkGzRc5Z5XHXpWFu+bx
         TDGDRtZfPHuF3MdWfTSOE0kbFqd6pjL+sziQvZrvug00fk6uNm5yzdfuDQfb7JJYAEHC
         poZfSkEJzM54BUOq1TwXWbRApEPizxSLfwT8eBrGb3ObKE/3/r0G+kvcpjsMb7op8kja
         wdg4CbMxNe5S40aFployZSk9XbYBTDDhdRFjmQ4M2117dbPnJlHGB/KRHE9EaNm+nCiU
         4mXPC23ChbinPENU0cm7iJEBkNWClqDRwgdgaCxa5c5wPkb65dNl6apOzUhu5/dT30CX
         wIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863869; x=1768468669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eis8NHZnE9ri0RzqLaxUqcXpiZJ26AU6MwmGkm8dkog=;
        b=Wmpme9QA8uAXqtGcVR1iphBgpduPDLSrLG/lvjI0KkTvSoRCHZEY8lIU5Glj9l93U0
         4N10wjxr/fxcQIjcwXWWVwkuaVIRQrcwVn4UsXRJJrrIuKjhMCNhEH6qGcDJi7AQUFiR
         zkKL+x7WLhrELLoQgltkj0R332GDY8MIfVI+/cAlE1te4RNxAKmFFiPp9d7I9pcSn1/G
         3degsNdxGcb44wp2Y30cyj46TB5lWZ9xOxfXDOlOQdet20SXq1gu1Uq1TRo2dZo3fgG+
         kXwrNl2Ssfc+NOkYJOiVPu5w6tfXyXO/flTv9UqY3i/cAGLdILFw/ZRQ1t2d7ozk/QB1
         N2eQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/E9Z/otuB4/2nei4BDlwR2on+oZaL10NytafzjIvwEHybyl93lue/WAK8onN+dKP+Ygmhdehv/13Gag==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt+Qfl1XycWXN2DhH28zP7Apx4D8RiqgRwwSWAOr5z1J5O+vT1
	SL/44NaJBZJ+vlALrVPTgL1r17dx3e/GPU6uZtTZH3zvB97r+6hwWu4EpqzDxnrnA7RHeu931qY
	q6X9R+N9Sg/wmb2YcPWU2JAv50Jktk4s=
X-Gm-Gg: AY/fxX5kFYUMDcfC+k8/H+RpfTPkyBebxsXJ+1QQ2mQXkAuIh24E1TZrUjuihJtRnUR
	KhuaFk05NDj+9AB4XIe1nGt2S0lnwsgQLteP0UapdO7TeadXl3Iv8BP9eshGTcdRzhKyw5wFuOE
	Qf14x3/9aREA9wuw9hykGrvozbvw12+YpE6i5XUI068OE+rAQjYLEHPnc0aymvSgNM+bDxyMpPF
	mLY44nO2CedXQrF4GLIEXT6gIcvoUFo6QRGtxTFVwiCASDHscJYJagjTgWJhrT+nvsqVq83
X-Google-Smtp-Source: AGHT+IH6nPwC7iVGr8ZWD/P8maW1+qN5Wt5sp4QkGF3llNXAnUY+tgYrWnq/Xe4GoBfHf58pSc+2xzLcbL1nuE4LGLU=
X-Received: by 2002:a05:7300:c99:b0:2b0:5342:e00a with SMTP id
 5a478bee46e88-2b17d251c0bmr4723716eec.15.1767863868438; Thu, 08 Jan 2026
 01:17:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
 <20260107144507.46491-2-Ashish.Yadav@infineon.com> <20260108-unbiased-kind-wasp-d8b61b@quoll>
In-Reply-To: <20260108-unbiased-kind-wasp-d8b61b@quoll>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Thu, 8 Jan 2026 14:47:37 +0530
X-Gm-Features: AQt7F2q8VU-mhh9OIuBTA7LAs723KM2jw3_egypa_L2dUHh1z-sfScapuExH8iU
Message-ID: <CAJKbuCagGJcjokdhejOiEsqyQ5Kc-uuqoCoFBikPF4UjiiFR=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon/pmbus: Add Infineon TDA38740A
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ASHISH YADAV <Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for reviewing the patch and providing the valuable feedback.
I will generate the next set of patches (v3) with the review comments addre=
ss.

I try to address the review comments with current patch which were received=
 in :
https://lore.kernel.org/all/2ee75453-0869-4348-ad92-f7ff71aca75d@kernel.org=
/

The Driver code also submitted with this patch:
https://lore.kernel.org/all/20260107144507.46491-1-Ashish.Yadav@infineon.co=
m/

With Best Regards
   Ashish Yadav

On Thu, Jan 8, 2026 at 2:24=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Wed, Jan 07, 2026 at 08:15:07PM +0530, ASHISH YADAV wrote:
> > Document the TDA38740A/25A device tree binding.
> >
> > Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>
>
> Also, fails checkpatch on SoB difference.
>
> Please organize the patch documenting the compatible (DT bindings)
> before the patch using that compatible.
> See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation=
/devicetree/bindings/submitting-patches.rst#L46
>
> Best regards,
> Krzysztof
>
