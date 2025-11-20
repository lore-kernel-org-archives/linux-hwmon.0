Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47956337B8B
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Nov 2025 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645079; cv=none; b=jYXaMF5CQ7uX8br+27h9ae9he+TZ6XyqHOmhunu0DcG8+dtWqDuRdnEnXhEIIUYnV8ntFmgKeNMnj0hvnh4jdnNiof+c8J1buFbjMqSzL5s7SNcKydZZqOc+aIbgssoeE1L4RrQch+uu54+eFkV7yoO2pq51I+TBmjPSAFff7kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645079; c=relaxed/simple;
	bh=DL+lTXpyI3idWcrF5KVPheQWU79qJpEwMGWEA4i/nKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsOQVLZYWf3Ub16m1OhgjkwMBdol5oymU908b5ELZQ9WjdaWhpUv+gU9J/xmTQmjsupCKxQhTwGLd1q+/KhIz+oI/7A/1UauLFM67SiVvBDEo5Hid56fRqJTRUm+N2fKixljnoZ9Ybaf3VoJv/YTxt91qZIKCHWoGA8WwGM9798=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTim7+Xh; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTim7+Xh"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-94863b3620cso30914739f.3
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Nov 2025 05:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763645076; x=1764249876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DL+lTXpyI3idWcrF5KVPheQWU79qJpEwMGWEA4i/nKc=;
        b=VTim7+XhGYVLVZBfy7YIMo1PROVKhE9lqfQKQEFJhME8gzFPVz7zWX0aw4Z30Oj2HO
         8imIZh6gXo8FZRh6Sj1vRNo2q9LFsbTe1OKYWT9A2ELtqS8UHV/jnEKVmXrjrbuEdLP7
         4wpkLcrVUeVWX9+Prb2fMbkZ8bj0RCYpUBBmt/R7N3rsIoyDXm5ApOlUy3yX6qw1xQYz
         hPlmiGrLJJFComTOtRSKfkcNKw9w9dAVy2i9YJbf+gdll0cIrobbD0sq8fWesUxelwDn
         Xl4j05cYegHu9D7bn04hToolNecjsUIYgaQQ37S7KfmHDzM1WoFa1zTwN1qg8//ObOS7
         4vNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763645076; x=1764249876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DL+lTXpyI3idWcrF5KVPheQWU79qJpEwMGWEA4i/nKc=;
        b=BkM7S4C9aFqHeKMgv9TLIZX/xIMHLpb2QpgBS4ve3AhlJlK9w0Ae9/RnYkiuubEUq1
         k7+gXxsEdwqpYsUNbJUeCmQCeY7xeAWJiwbSaqYwpjCroI5Hxmr+XL4UYsrUXR0WGu/Z
         Ew5vGbbVwpAknzUl3FUC8VgC4Wp17TgJE4UVBEHB6n7x3WPYM3nocHe9sGJHHImBf884
         Oo3s5s6Xph1wT1xkzdoJOAypMIWdI5cjk+CNdgg0KclUus9v9isbbo/pw7YGh7nwRuHM
         mcjzij4usLHqsttR8Gzd7FQzeslDz77l2o8XEBz2Tjtc2h6yEKDa9+BI3axgWhwT0+6Y
         mvbQ==
X-Gm-Message-State: AOJu0Yxo/Fq8emKxEXgSyoEO9LnlFf+O4bgo0MQN9kZW4GK4CXrbGR23
	0JxUxyX1Pk60vctRChEDs4IZsObW155Ng1undqs10nn6FI48ac7FmPDSWIn7gA/sIrFlCu4Ehsn
	VdvAL2teEk/ie/vHY3kkCu7VtPlExXmYZFxAF
X-Gm-Gg: ASbGnctCRTPIRhQt9aP3T7f+iGGkSonuW4xPC3tQDKksUP5U9d91oSsl2Nku/bMBwS8
	ifEV1xHAPfNBoWQr3AT89gYxvpMiuQK79JT7JAO/EV9cSVw3GQZvTYOhAjw7JeWqELOWkwmDfQB
	pXxYm33HyJiIWj5dENFe5vW/6uP9Wl0ACr+Ts+bOXv+ZYWuiF2OdBK5oxSomBmlKNICesgCYJsP
	PkemIkRUhjpfSUtZc0QW04LX8i4XQbA+mp1LWeA7axJxqmlca//EMuTsfPjnSXMEus=
X-Google-Smtp-Source: AGHT+IH7eU6KOUhdmESQN1fkSWDzyISGM2UKxoOsk+c5YjwQO5ZMl7e8gHcsohc7vWXtj55bUxXv6qQf7pSIbd5qNiI=
X-Received: by 2002:a05:6638:981a:b0:5b7:326b:6e09 with SMTP id
 8926c6da1cb9f-5b953fd33e9mr2772170173.2.1763645075994; Thu, 20 Nov 2025
 05:24:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120.140009.210830394703243387.rene@exactco.de>
In-Reply-To: <20251120.140009.210830394703243387.rene@exactco.de>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Thu, 20 Nov 2025 14:24:25 +0100
X-Gm-Features: AWmQ_bmSnMn3MkmodIDu1Yljj3Oe6lOPsWjvk3zi1CFuzsGIUYuGWfAJf0P5s5I
Message-ID: <CAB95QAR061nSxdO4iRHHdh7diNxUyDEoidmfm_vDiYYRyBYu+A@mail.gmail.com>
Subject: Re: [PATCH V2] hwmon: (asus-ec-sensors) add ROG STRIX X470-I GAMING
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Nov 2025 at 13:59, Ren=C3=A9 Rebe <rene@exactco.de> wrote:
>
> Add support for ROG STRIX X470-I GAMING
>
> Signed-off-by: Ren=C3=A9 Rebe <rene@exactco.de>
> ---
> V2: Documentation/hwmon/asus_ec_sensors.rst

Reviewed-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Thank you,
Eugene
