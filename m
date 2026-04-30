Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C80B478E56
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 17:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777571828; cv=none; b=NTWFOLG6oPf9nHkTui5orCqewft6V4kVT1v3q9hirfWxftCTaW7/RzvI1Xy3cBxpwcZPb0XWNMyI5SF2wBKCeMLSGeaNY1QeQTlgpLEIWBsKJOhbnDqoUnz9d1H4qdC9AA2l2MFOBjAvKWvelvn9+TPwPmCnp9wTM/ueQii8HFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777571828; c=relaxed/simple;
	bh=Si9XWxBGvLrdQNvQasBTMwVASAqKP5AP7jxdKns8/7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjMbVs1SqyBURBfM2oIBjbxbPfAVONmqD0341Sr7da/ycTr08G0tVb6vj9MZ+qU0HuCU279Dgm7ZONC50gLDy7aOritdlgy3LWPUzbR8CVkAzyUZB+uUWzGFX0fCUeCe3jAdvp+5U8TnwSdPHrAdV/cigBgr1ww2KGMfzUHTGFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPXEaH/V; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPXEaH/V"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-362e50b4641so754631a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 10:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777571827; x=1778176627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEldV7foT5A232kDq0rnyRxuh4l0nSkVnRNp+w8Vwlc=;
        b=MPXEaH/V99vtTc3b1/l6LE0n7HTJ88FoNds75dnveCXV7w2Wm9v4NwPPHuNiEd+aaf
         FTl7uoNFS/bQJo6E2lMkoRvmvsj/SNqEmO7yjovhFqt7IgZlYIXV7KwfCtTcE+l7rQFf
         lPqdvBk8hsJEvwoAJ79xqqWRYPr7VXieWn8QfA62xmWUSDAfWtccXGRymFnFY4Lip3Ff
         TPk3KoXhTQE81GOUU4lb64PK3vvXfFvQe0yKdXLUinwr57BJVVofmJJF5qpK5+HCO2WN
         SNi6+eYfzqok2jMTxWfzno74OCxJIWduEaiBEESi9luCw3/jgkwln440og4QrDks7+kk
         eccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571827; x=1778176627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LEldV7foT5A232kDq0rnyRxuh4l0nSkVnRNp+w8Vwlc=;
        b=G2FZOZBsY7Ei4PxjbmqCZV8UKYA09e7NpR7iTJEtkxorAa2B8av1NI1LnMhbVemzDK
         fgptUlTBgNWQyANpEkJz/LfiGF44cuuFABaU3TcrM4zFwWTEYEV9mKm/KiBMjlP46vkQ
         8xDiQo+wnXbbIRvigk4mL93bjwBtu2mbV/C5M5+Vmp6uCkzaQb5E7kqTxF3Q2FcwvzMg
         n+cdC8gwL1aC5p0iH4yQR+zKPnlgKFed/85nf9EgNHSNFX6Xt9umgFBNhAALFIytQWdb
         JIWAivNi90oK+KPtNNBC2IApU4HUloeGxfFrWN4jz2MOR35QrU7TffBgUWuznJ3ujOpP
         68Sw==
X-Forwarded-Encrypted: i=1; AFNElJ/E0zV/M4QnjaOCtGo7cZUblJ+AzBTmCmWXNwEyMVUm3KOiXaub0N5DX+CBgfqmrGgC66yh37xh2S0csQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR7BmeCWORvmXcbhtkobMEpTDh2tRwPeZAqJF4kKphpGF6hEpO
	sohtSAuJr7dbUDvK7+hgZ52kXFp/jo5YZywNAucDiK1yp+MK+GFJKmf4
X-Gm-Gg: AeBDieuFwXwdWE0xiIO3b9oYHIZGrzZMzm8+o/6gLslWYEEcmFSKkYCwZoD1ejtmM3G
	L3SdYrDTYgynQNEVHuRWZpTcM2oHm9QZ+/9y5u/qnrJVD4AJwAm1Mbgmxcl8FijyFhF21/M7wUG
	KGFCphSh6Ef8qNMdacmFo9MHXTbrRyVLBM/ZyZ++kDCNu5hV0HynhiAB3GlX04L8eKkEwSnzD03
	jAUvwVWnJFxr9UYIb+QeMjrM+q8X6Wi91fETdy06bh9kHWuOqUuMZMCR2MLk6mdvmXJcAoUvUo0
	gmuV2hQY1f/JcYxGerYabaqiMIEKGYHEoMj/tVSV0HOE3VMXamothD2k3IJQXQ9YYQcPscVHGzi
	q7JeCJpLa6/etrP2ntI1fk0qdDCmmhNPKoqhBbAzhrpgZ5IDTnle+/Co2NaTT3xq2MnB73/NIzA
	ovkqlZgAFNiaFBXmol6dHu3GO5kQvOd+2QVY/AEnP8HwR0sSw=
X-Received: by 2002:a17:90a:d444:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-364c2f8bf3dmr4137344a91.7.1777571826829;
        Thu, 30 Apr 2026 10:57:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec00a280sm53136a91.10.2026.04.30.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:57:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:57:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: sergiomelas@gmail.com, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] Documentation: hwmon: fix link to ideapad-laptop.c file
Message-ID: <30d60aab-911a-4009-a8ad-393591baec58@roeck-us.net>
References: <20260417191411.713958-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417191411.713958-1-ninadnaik07@gmail.com>

On Sat, Apr 18, 2026 at 12:44:11AM +0530, Ninad Naik wrote:
> The ideapad-laptop.c file now exists inside drivers/platform/x86/lenovo/
> directory. Updating the GitHub link to the correct path.
> 
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>

Applied.

Thanks,
Guenter
