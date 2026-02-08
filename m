Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FDF350297
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Feb 2026 11:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770551293; cv=none; b=XE8fTDEUiGiHaAFe8VARjyEt6NZhyhLddc3O1lunVkQUp4cIbOv3L5Z6bvVTrmT/5oDg52M+PfSmgTns8iTnemMPniRXbEGqaE5531bcEsRf4lqfClTPXaLphalTmOLnwswK+k1eCdWnvliQMlVpCUzmJ2GZiyOk9bl3z0mHJRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770551293; c=relaxed/simple;
	bh=kOtJUkHc7QaeZVHQeI7ehTWWIzpadGTi8Vudy6UBKfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iCnTvi9l9Y6dkGWcOYg++7X3Wy86u3wT1Tznsd1xQ2IPdTOFC+g+fqYPDwqd1cdXopBUItZk48USoLOGm0H5oULoMaJi5E4ky48VZKQhRN4xSo05ew1yFOA5qJSJnmgWuFdPvhXLqbsYNKUJaL7k6kGOdATHhGuuj/4e5pIe7Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+ZHYATC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+ZHYATC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so33643415e9.1
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Feb 2026 03:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770551292; x=1771156092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYOGoHWlR/eu7M6OQ2kE1xOB0jjtOqAsLw5aYMd4kfY=;
        b=e+ZHYATCDil7QXla5wldWTQb5Mw8evJ/+FvxcrGSHrdNTuDDER64nn/baIwNuWRKoB
         uxYw4F656JSMrFLzkLVDUFakNUaS3yLpopdHzHX4HRMMLkC0vvFTNCh7x8FgbFORLMUa
         abizx0D8+ViJbwBL5JboCX+VjCINu+EFMCF185nPKRuPp8G5vxaxCwS4++e2BVm+hmoC
         tHjotq+FdEQV4C6v6VN4ey9rpmL6RNSCKI9OarUsfRf2+NwzhXTjJySN5sqGL8k+Vvpn
         XzWxZWF3/wHa54Fo40hJCGVbLYK735Qg+J8kWU3S2wuUBrUJv0T9CSyXoq3efM+uNNja
         l4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770551292; x=1771156092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vYOGoHWlR/eu7M6OQ2kE1xOB0jjtOqAsLw5aYMd4kfY=;
        b=OdJJ6afVlBDILta59Ueb1qz4/+UcK+7IoRn9mNAEdNp3sV31NtzG0tn2RwPmsJ/2pG
         /9V+GlhiSb7IYC41CfhQp+sQMihujlYQB1e2mVIogsxDqH3sWbFLpxsqIN4K0dHHEAQc
         Is995mEzsfNjdJBiaEy9/r6/+VmVBbFzSbxbX6b/lKFfDlp8SAHqmrrNW0GoSPQI0aPe
         fgc5PZylrHeeR929mAeQieraxoHLTjRr1XQ21YtnXaNSxh4OpZuNtwUlPg5dpMdGoQGV
         9EvfU4zM4gXlVxaEtxHW65G0Sf0vd3MXyuOcfIbhcDgF+KMgnJaU+fFyAY+IpCxzPZTn
         w/sg==
X-Forwarded-Encrypted: i=1; AJvYcCWZGejli+qU6dEqIbG5Zu2hzp9/o2fflRcwM7AjFGiOwc5eDKwVkhU6sh4XOebYuXlTaH/u7PCAv+zhRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrCqzkQHyfZ1Kg+PZE/CraSpGzKZU6libWWGunwPanM2LrZe9s
	il+MeYjP2r5qxP7hGFTkoQsUW13Ee358IxFDoOZ2Rhzk9rm5U7XBTJvK
X-Gm-Gg: AZuq6aIoFFDOktrpTpkNMkb2LhVpTtFZlxO3J7fVVXHpV8jvEOTBJBe8Pk8ptDdTpZb
	dD0FmRRpY9nYoorE8m4Te5S/96w3MyQ4muNJyLEUPLz37lUtQ/b4C86MurgXi8Bgo1YoqaL7ZBL
	BJv0Pv8twzQaZAH8ypReOHlSp9gZ90QJKRX1KOcZhwcsQ/tpzRKYuNpkHJHT79vkIIBu/YKD4yO
	6JtCQJwNAzXHnesdsFYe5qmWLhc1hvVKQkz5bCabfHKED8NG4FWEEE9J1zbcFLQfDUmZJOWAUKs
	UM4yLtXXiY8Yt+oPGfZB54UN8h4YvvhPC5zbxm3Db/tdQvIMCQ4EIq1i98mVt0+C0hdhEZv1Sww
	ITyU1qBtJrQl5x136+kC1dFOwq1EdR3s0a1fyOv7SN8a9+3gK3GOebLJi72VsfbH+XwScNockv+
	bJAjBMAsEGhuDgHEqfWSMduFNET7rf3aXBp44WgLzodAL5chGhytYE
X-Received: by 2002:a05:600c:c4a7:b0:480:f27c:6335 with SMTP id 5b1f17b1804b1-48320236645mr117866695e9.25.1770551291467;
        Sun, 08 Feb 2026 03:48:11 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d3e245sm276610505e9.8.2026.02.08.03.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 03:48:11 -0800 (PST)
Date: Sun, 8 Feb 2026 11:48:10 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Gui-Dong Han  <hanguidong02@gmail.com>, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (max16065) Use READ/WRITE_ONCE to avoid compiler
 optimization induced race
Message-ID: <20260208114810.3709364b@pumpkin>
In-Reply-To: <f6710a1f44d2b32df1cb9b09cddc6695bf76eec2.camel@decadent.org.uk>
References: <20260203121443.5482-1-hanguidong02@gmail.com>
	<20260207104308.1bc31102@pumpkin>
	<f6710a1f44d2b32df1cb9b09cddc6695bf76eec2.camel@decadent.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 07 Feb 2026 12:43:29 +0100
Ben Hutchings <ben@decadent.org.uk> wrote:

> On Sat, 2026-02-07 at 10:43 +0000, David Laight wrote:
> > On Tue,  3 Feb 2026 20:14:43 +0800
> > Gui-Dong Han <hanguidong02@gmail.com> wrote:
> >   
> > > Simply copying shared data to a local variable cannot prevent data
> > > races. The compiler is allowed to optimize away the local copy and
> > > re-read the shared memory, causing a Time-of-Check Time-of-Use (TOCTOU)
> > > issue if the data changes between the check and the usage.  
> > 
> > While the compiler is allowed to do this, is there any indication
> > that either gcc or clang have ever done it?
> > ISTR someone saying that they never did - although I thought that
> > was the original justification for adding ACCESS_ONCE().  
> 
> They do it sometimes and it's precisely why these maros were added.  It
> makes no sense to me to look at what these compilers currrently do (for
> some particular versions, optimisation settings, and targets) and
> extrapolate that to the assertion that they will never optimise away a
> copy.
> 
> > READ_ONCE() also includes barriers to guarantee ordering between cpu.
> > These are empty on x86 but add code to architectures where the cpu
> > can (IIRC) re-order writes.
> > This is worst on alpha but affects arm and probably ppc.  
> 
> No, READ_ONCE() and WRITE_ONCE() don't include any CPU memory barriers.

Look at the alpha version and the arm64 LTO code.
The latter changes the reads to have 'acquire' semantics to stop re-ordering.
Needed for LTO, but the thought is it might be needed in other cases.

	David 

> 
> > For these cases is it enough to add the compile-time barrier() after
> > reading the variable to a local.
> > That will also generate better code on x86.
> > 
> > The WRITE_ONCE() aren't needed at all, the compilers definitely
> > guarantee to do a single memory access for aligned accesses that are
> > less than the size of a word.  
> 
> I think in this case WRITE_ONCE() might not be needed, but it's also
> harmless and it's much easier to reason about {READ,WRITE}_ONCE() being
> paired up.
> 
> > This all stinks of being an AI generated patch.  
> 
> This is a follow-up to an earlier patch that claimed to fix the TOCTOU
> issue.  I objected to that because in the absense of READ_ONCE() it was
> not guaranteed to do so.
> 
> Ben.
> 

