Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E63426EBC
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Jan 2026 11:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082178; cv=pass; b=hOPIYQELmjBYhgZ4BEQlUxDxFYy5wOz1p3OK60T4IlXUrB+cbg49zPmF6dUkl+miiE9iPmD+o0/Lzy5fpEXkSYP4pdXigFwVvFyEJh3/kS5UCs91zPce1W7Zc3uND1m67/883f/2wW+d4eNloKe1xA4UsRO5XFY1et8afE/bD90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082178; c=relaxed/simple;
	bh=F8Yc9cXJy+2eoQ7TPFhwVWvrGAhXxpTI6YyYLtkj6vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gK+hOdd2AubYykEWrhPkWAsRXOxEBLcENs4T2kiTo5g1rCfBX/6qSpdt0CjdIjFJgjrerkT2C32yB7uBPSlPI6EbIu4GDeN5hB6VAwVs549nj0CDEAL23U4Mb1lEMXl8Tm42RLP+UgorFdOvgut093tpfZwsu4TVkvbMMX+q01Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRKl3+Pr; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRKl3+Pr"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so2014268eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jan 2026 03:42:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769082176; cv=none;
        d=google.com; s=arc-20240605;
        b=EV0dqpEhXJJnLjHmCilctCZiwKpLThVhqqCK2n13CRmXDQ96kUm0vpIvw3xqI8nQ8j
         xkbwf1s9sq5xoKDCt/NPB6fuIKwNvlhiby3S78kBNQxpo9RSkVuA4QAyQXNwzfBWHHWX
         MVAFogS4kCU5oLbmwitfF8wuFvF9ttEffg/VCnjsxJ9dtRc9nwAIjX56hDo8fFqYUO17
         UfB/JvsrP4xmKMtSmvga9kdO/l56ZA6BazE6CIDXa8SF+YeSxAEHz/la3ADF79s0sdFg
         sN+crxtOyN3XdzI493tPDSJ5C+6gHacHTSb+M/GwBOS6zQWtbUDmjkmqODQCKYKhnVAX
         xpaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HE/sohNG8mICW2nj1/0OeJe/N3MzO12zyrycF9gVJ5s=;
        fh=fkrGTNnwqqGLdXM5ty11Ix6enGkRnfnK0C7xTBVZ2oM=;
        b=I6Gp64szeKoywIjdQsfBjn++Wz3cUsjAxXOQLkWXcYRrfb+R2js9n8Vl2a5xUMzIJF
         Xu0acSbWaBZgEqbAmhldLqNrVU1qQ6uIrKS1uCsXRu0M3FbLJZddfpksupya740jh3GG
         gW5cloF6PNtVEFWNvoDoHLewNHluI4mzswpwQXC5PG5GHlCeSgziJqTJvKGWV/ixVrXJ
         qkzYMJPi8sYfx9dScPuQr711yXUkpCjwOg5xN731IAqjBtDkmnl7QJkC8OAb6oIikVGF
         7wD26b108WfyruOxcrJk52ob1mOjQZ7D1NCCaMDKvr90+fPMxqwychu9z694bDQ18HJ3
         OIZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769082176; x=1769686976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HE/sohNG8mICW2nj1/0OeJe/N3MzO12zyrycF9gVJ5s=;
        b=dRKl3+PrFRsUkEla7QbEOv8VjtEX5B2S8UmxykIR+St9sW9mIVmn374Q7v0QzCJHtt
         cRpgFDM+1eHwoLplWkajzCd73HCoaaRZmdDIRQO2H0Q41/t2k/J29SoTw/v37b1nETZM
         875mtEtWwcC62/NMQU1tOgBlvAyNkJ9q91fCC8EVnee8eyhVfVZqOImCtxfDM3d9wyS1
         CqIXxk7Zmc3tNEf/b9xrSLdlDC2QsMakyLpJNtbaaGhaVTC9qbYVV9oJuVR2iJNpYBlZ
         QGUONbMsWbFu64xHLWEb7KXx1JXTif6Wx7Hv9C0MNV6HH2+ox9N4ab1n3X8xcT/OmjVY
         3o3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769082176; x=1769686976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HE/sohNG8mICW2nj1/0OeJe/N3MzO12zyrycF9gVJ5s=;
        b=Z2+/D2EIpQJoaXaj/NY5bWTJUMVBSlvdBThvRtIHzu2JD0gs1NiHvWSBRMvGySmvoS
         dSocYAakNOP4+z2DJsbeJdzS4gvQsrLF5VBnbosQmTF10fzER69OLMnzttNYbFGoVvb9
         9cf/GZ9PxWcsUZwJLgcIlerRTBR4Xpo2KzsC1u7+rm60b6UoMFvdhxn7HGv5YNDRuwP7
         Ix7rUUIE4qlgjY5Lt2I+vgjcImv9qLOun1eX6GMZIwKy+kIbZAmBPWU0cJriyyjm9Fb2
         TB8FTCNtMQPawF9Gb5VciF6t3gOZJre6caTG4GnNOlRb2gwLqGmfRroMp7AXDmyp+h3y
         wAjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGhfP05sp+rppw5FRKlv/dCiTNoIRtBLt6orT2vCrKz69WEpUcXSIKiJNT0ebRUFZYWs+YmS7K2B8jmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvDBArJ+ArxxVacDFzjmNH5SIQ8u4nw5/ypkbTuDQF0XMVy8XW
	2XduXu2lBkuxmUDb6Nhk8a9f+6tez5PsU9iC4LNb+cV6rO2bRK+lWmkLwIi8NIJhx6tD2PscOjN
	sSFynpJp9eBXuCEJLNVReuej1LwYAhfg=
X-Gm-Gg: AZuq6aLJYszWTD0yzPN88Zq3I5nJiJ9XQw5YSW7FVA2OtU6bD5yPXFRhvLHpqoNcUBq
	C9d8ey3yLPD6n/k0SGPsFZJWFd7aVMZAhLQIlOt3/qPXTgVyK4tAodf+iUnkYgVWvx6j6KCYfz5
	ibXk4DFLTS2RJGGd9UetgYdIfSu7ubZ+OTjKf8seGsPKGXp5FdQH23Up/UMZPtgLDkxX1c/mF1V
	796hBCq2WD2szs2jb4PHP21DDFsV2eqYTusJEq72h7TemIPn66LN0Wuhgn/3ujoBjJjr82Y
X-Received: by 2002:a05:7300:188a:b0:2b7:1d5d:47dc with SMTP id
 5a478bee46e88-2b71d5d49cfmr2705056eec.22.1769082176019; Thu, 22 Jan 2026
 03:42:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
 <03da3b10-dfe9-466a-9dc9-b51e29938e3e@roeck-us.net> <CAJKbuCYcRMrX5H5rWXWXOz4FCZi5iu8CCE2Oi3WEsWqEikqsYg@mail.gmail.com>
 <f0d230be-676b-47b9-9565-22319b8e62cc@roeck-us.net>
In-Reply-To: <f0d230be-676b-47b9-9565-22319b8e62cc@roeck-us.net>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Thu, 22 Jan 2026 17:12:44 +0530
X-Gm-Features: AZwV_Qg5AVdgqRe_8IaQnW6DxlahFcEHezmvgXFNpYdUF-cPzZtqukJhMahbLU8
Message-ID: <CAJKbuCYUCr-R-91Ou1y6XDEPdqabSDvCxUypc-YmW=-EPxgNyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hwmon:(pmbus/tda38740a) TDA38740A Voltage
 Regulator Driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ASHISH YADAV <Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Please find my response inline.

Thanks & Regards
   Ashish Yadav

On Tue, Jan 13, 2026 at 8:40=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/12/26 23:24, ashish yadav wrote:
>
> >> The need for this, especially why it would only be needed for PMBUS_RE=
AD_VOUT
> >> but not for any other VOUT related commands, is still insufficiently e=
xplained
> >> (and I failed to understand the rationale provided earlier).
> >>
> >
> > It is specifically needed for READ_VOUT as it is being used by
> > external controller to monitor the rail health.
> > Other Vout related parameters are used internally in the IC to for
> > output voltage related protections and does not impact any external
> > decision making.
> >
>
> Sorry, that doesn't really make sense. How would the chip know to match
> VOUT with its VOUT limits if both don't use the same scale ?
>
The chip telemetry would still show Vout as 0.7V as it does not know
about the external feedback resistors.
Hence, no need to scale internal Vout related parameters.
This scale is only for external vendor use to tweak their telemetry
output voltage reading.

> Guenter
>
