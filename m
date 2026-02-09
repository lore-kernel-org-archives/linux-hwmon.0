Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7BC364032
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Feb 2026 09:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770630642; cv=none; b=dhPHow3zb3edERLjfoELdCwZj4Vb3LpDthdbRPaZLqNZ9V9py3mo273Z1R8AHOjMkFgPI8OkhvZsD3iWH93Rcwh1lxOtzp8NTrAEnSaF/TXFAWVm3tyERua92Rp7p2WURxNeHAE0NKEddzcKzlE04OGTlSygqV+1jmUBUyx9GUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770630642; c=relaxed/simple;
	bh=G0AZtPKM9LqmL8+9X5WtJjbdlbwoTFZvZ9q6vhURmcc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rw3H1noVelxAICLMLxQRGZXm80L66hHKw3lcFlOFONEw7oOw6xjQToo1JjtlmmdtBUOuMzg5VWT3HInRE6480HvqIZTm/NLg9II6KuhrIC41bQcL6mX55IshFf6XGc+be2bgkibAKq8oER87GYAXX9o2/Pd6EHwC010baBDoN3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkrESqaO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkrESqaO"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4359a16a400so3960278f8f.1
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Feb 2026 01:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770630640; x=1771235440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3Fl1LdKzLTKTPiN1YZNuSPUICwP+bYYrhH9RATSKdE=;
        b=QkrESqaOo2uIYUQEwMF7O1u4QzRqqiSn5/5X1VnxFmhyw6qP93+e8lmjeeyi/sZE8v
         xZEsSmrlfYXCoFP23EPEsXR61m8kLjdqDpF84S9JU8mKOGh48aPJtvAn/Bdh77n5YdIS
         59ZuwsOEcWaHAXyan48s10JC3O4nWZrs6i6+r/9g/12gllOIenR/Y49A8k4h8lYJ90Aa
         Ou37v4UpM5s6zXTxlANh5ZbyFyt6Hr/n9d4+Z1XUQJcIo8hDhXWn8cceuxy98wXJKHhT
         wysYEsCeOpF6InYOYS4x9c95sXciZCVCnoiv3j6kcav5TrL954V+5Ud4flW6RNMCmyTu
         eQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770630640; x=1771235440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G3Fl1LdKzLTKTPiN1YZNuSPUICwP+bYYrhH9RATSKdE=;
        b=INvD42ZZpF/gPHx8QZNiT5JTQTAoqgs1nvIJ3aEJBKV8ghZ4+Zbi7A299mTC40A8vr
         nm8gyStD4h76QY7GTjaampS1j04MZNuoDbPhZfCepfcySpe/MYVAVGTDeVBng8vFYBfg
         RK2PpY8gAFdByNY2jMqQpj/Ufnbt19xSi9dPh6bNJzSlRHQR3LJiVbgWE1J8pZOe+vrR
         2EDe4aTzrUW6GnDZ4J44yv0v2HdBjLSd6jN5+xeeLW5oXa0cCMKGDbe7l4qSOjvzEt67
         XmK/SxfRvytxje3wx/Vhi+IVJqphWAcVCTmFwA8DbFtOtvUEuYhvY7OSOfbIpwOHDIgz
         Y8Mw==
X-Forwarded-Encrypted: i=1; AJvYcCX/IYtjo/wdwHnkD4dMxkhK5fonZB+4JwGD0IyeE9UXtYgQJS9ZLkZJDc7Bi9rb0Cl1IecuG8+fkeJXFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5ekR+B8AL7GUoWQbxhDf8X8kP27aFglkSdiCo9xzl99o4ha+s
	wQ0kirdDSfXc8Cm/R/geM3wk5tRaIt0uQdqswS9UCHhZKDEwVVzfgVIr
X-Gm-Gg: AZuq6aKg+uXceGZusM1CjmRfjQDC1MD8nktrHaA7ziH+K1hhjX2MlDqhFRixL48waZK
	p9/qh0Ve4t3Q7dU6puHsSYxtuC39u97qCplDboyT+PQ/eC0xB0KlQkoNOXc2KWsqa5beHIffuK9
	nOm0Ly854exIvwQLGqqdwL2I1bm1Xh1nzio5fTrB87N9H6JqwCN6aiRnE6W3smraCM3asE+/hsS
	mxlGw4Uc2OF/X5xcRtDRta6SJyYaTP2asLS917vOBIEl5pzOctZD/F6kwC3wtDdM16Y0fr6bUnQ
	XJq3OrGjXw4pamX9Et6vBHGYOGkSMULLa+lIEqpOusuSn9veuYk/jWdo8MNA7lmISL9EgDbWrid
	M50tpHoYb5Hjqctda6bM2hiUqPUAQ2rvEZmg8m1SPqIs163t4F0iVfSd/+/46v+oBFrZylhTcJY
	QhW2jRvzWR2BEtEiDICdHBSxhuE2AN0L047oK2o0NEtreTiL4SuYHC
X-Received: by 2002:a05:6000:3105:b0:436:42cc:25ec with SMTP id ffacd0b85a97d-43642cc27d7mr6508644f8f.9.1770630640051;
        Mon, 09 Feb 2026 01:50:40 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437699bc1cdsm11376577f8f.7.2026.02.09.01.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:50:39 -0800 (PST)
Date: Mon, 9 Feb 2026 09:50:38 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Gui-Dong Han <hanguidong02@gmail.com>, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (max16065) Use READ/WRITE_ONCE to avoid compiler
 optimization induced race
Message-ID: <20260209095038.50e62eda@pumpkin>
In-Reply-To: <000915fc444a6e1f840f3d4ed6493058aefe850f.camel@decadent.org.uk>
References: <20260203121443.5482-1-hanguidong02@gmail.com>
	<20260207104308.1bc31102@pumpkin>
	<f6710a1f44d2b32df1cb9b09cddc6695bf76eec2.camel@decadent.org.uk>
	<20260208114810.3709364b@pumpkin>
	<000915fc444a6e1f840f3d4ed6493058aefe850f.camel@decadent.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 08 Feb 2026 23:33:31 +0100
Ben Hutchings <ben@decadent.org.uk> wrote:

> On Sun, 2026-02-08 at 11:48 +0000, David Laight wrote:
> > On Sat, 07 Feb 2026 12:43:29 +0100
> > Ben Hutchings <ben@decadent.org.uk> wrote:
> >   
> > > On Sat, 2026-02-07 at 10:43 +0000, David Laight wrote:  
> > > > On Tue,  3 Feb 2026 20:14:43 +0800
> > > > Gui-Dong Han <hanguidong02@gmail.com> wrote:
> > > >     
> > > > > Simply copying shared data to a local variable cannot prevent data
> > > > > races. The compiler is allowed to optimize away the local copy and
> > > > > re-read the shared memory, causing a Time-of-Check Time-of-Use (TOCTOU)
> > > > > issue if the data changes between the check and the usage.    
> > > > 
> > > > While the compiler is allowed to do this, is there any indication
> > > > that either gcc or clang have ever done it?
> > > > ISTR someone saying that they never did - although I thought that
> > > > was the original justification for adding ACCESS_ONCE().    
> > > 
> > > They do it sometimes and it's precisely why these maros were added.  It
> > > makes no sense to me to look at what these compilers currrently do (for
> > > some particular versions, optimisation settings, and targets) and
> > > extrapolate that to the assertion that they will never optimise away a
> > > copy.
> > >   
> > > > READ_ONCE() also includes barriers to guarantee ordering between cpu.
> > > > These are empty on x86 but add code to architectures where the cpu
> > > > can (IIRC) re-order writes.
> > > > This is worst on alpha but affects arm and probably ppc.    
> > > 
> > > No, READ_ONCE() and WRITE_ONCE() don't include any CPU memory barriers.  
> > 
> > Look at the alpha version and the arm64 LTO code.
> > The latter changes the reads to have 'acquire' semantics to stop re-ordering.
> > Needed for LTO, but the thought is it might be needed in other cases.  
> [...]
> 
> Oh, so they do.  Sorry for "correcting" you based on my old information.

I'm not at all sure that the field which just need protection from TOCTOU
and load/store tearing shouldn't just be marked volatile.
ISTR that part of the original objection was that not all accesses needed
it - but the static check code seems to be enforcing that now.
Marking things volatile mostly stops the compiler doing CSE - which is
exactly what you want here.

	David


> 
> Ben.
> 

