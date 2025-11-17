Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB43A298CBC
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 18:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405102; cv=none; b=ags0sIg9Rk11lP9cXEQlAEGjfXjQ+Sl8WRfHAqtjOWXUulvqrSNPjNT96mPkat+0ZcuGZnmO5i/pgCIsW5XtA0dasf1Eublhpln9Oc3KU5Nb/awDl/TTk2N2WgVju6nJvB2lGn5yjo6M0ti16VGNW0e6/92ei6YLZC0GxeZFVsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405102; c=relaxed/simple;
	bh=hAi+lAeCBat0jDK/dx9mOVuVIoBkzbW2jrUtEFrxD7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SW7eNs/Dr7+DSsq4+WWmMn8DOkCzad+siVfqRfefaxehH1PKaPVwte+9Bsk6wi0eFNT+nvTDjv8dDbLFApH3O54ntqzHk4ryShDARfn1W4foujEykDe2NYfbhAXMNknUveFGTCEbgYXa3bTPxK0X7nycXU4K0KxpnikVGKSFHKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiBk9HCn; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiBk9HCn"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2981f9ce15cso59199645ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 10:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763405100; x=1764009900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66CqLzIZKKTr9jd9KPhG4EFQybLJIMny/rbtdLS1jIo=;
        b=DiBk9HCnQbBLY7g8qFYPPSUJVX+bLHzPb40MItdfcAcAh3R4UwgAKk2V1sWwRVh8zz
         En1CoNrL38/nn1n995Q8Wwv4dP1qoWX7el/wB6plYjpq3g6/S3rSMir1PE1LODYEPKdx
         QpiGRyplj0/lTX6qwIAfQ44y5QL8l4wSnc6igEEt2oRX9kbh776gZwf96jjpYQroT7lU
         3ZVer5siwnIPsbSCCm58mcxszZwULqUO5wlcNz0hr2CWk9ynRbaZk8qewMJKvN1X8xW6
         01fFyDDGUESLFq0KuQWdfeONy+cqRodNUBZ1mimCOSuyE7UE6T5g0k76pLilUY616RyQ
         S6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405100; x=1764009900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=66CqLzIZKKTr9jd9KPhG4EFQybLJIMny/rbtdLS1jIo=;
        b=HAEHHxnC9rzb5AoiLgAbzy6nQMIOxq7CiMEBUETGedlDoRFExKv79XeMoO01dAgfzK
         OXCObm1xUzZgBbU4eWPm0pWVOejDyde4bOOZ5IbISuRZBxpARo4ebcvfCHhWRf3PIfj9
         NMPxQOhebXGdDBIDR0Hy2WyTiBYY3Q6vK9DLJfhNOH+mSI0xX0JD57Gx+5ExWPI7TI/k
         lG8x1VfEFR3NPOSOJgqPgMQ0+TBHGL+dFKgXhVqq5I9aodRSrxdOzkTNDcyUBrxi0eUZ
         DBeyPf0uolwzC4VAKGmtxoo3rDpaVosCOXh0WRH+9BnpsD/7qG6TDD/jStPDOIZYUZ6E
         SqXg==
X-Forwarded-Encrypted: i=1; AJvYcCWkg6L5TDijeSNu/xO5muDkOs3x1jQt7s/YHXgdFX2ejbtmQpIUBd4Mv7V7tznc4EBCddK+0yJb1/jeBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHpiirLmIgH9gOBgDZA+G4lOPeErSsXGFBafcc/4l3IL4qkuD
	3Fo5OZI/G4kjkBFGKklfEj7V/fdo2QFV/FJ7znhSw+l3W2d5+0F56E6p
X-Gm-Gg: ASbGncslNsx4+JknqjlYyoDXUlvmO8zrIThSfAiEtv/xS1IuKE6wukpU5fjMYBBuMXB
	XyMNk0HzJw367BEnPAwjwhovO66gQkoIbzb54Q2uRtpBtybdb8IYzNmlp4w9zNo9gFXgOYrKmzf
	QeM2cpmNDPMbwrSk5bTT/XbyDyylLscjZmH6hJJOAzQuu8p6mZaw0XSQlxyTt9KUe2IvtLEKWRo
	V+uYre6t/qvsVPIffUYdrzmWo8Ju4qGiO02wutxzBgKFIze6QB30qCY6tj8pULcCZUbpKGMuoK7
	gQaYBHvnG4uG3qzyHkOy6NddMDqiYEFsbb1XIY4gu5CFl/bZuRFML24k5ynVxdUw4D7iTSIz2I+
	JhWHA+euEdq186/+UFzzupWWtBJjvEatwAwdu0Hg/rInmvYgk2OhCBecu6q6KY/bMZjiePqdzAz
	ybReaif/iqX0mk
X-Google-Smtp-Source: AGHT+IFxntdZk8l+drXp0KlOPVi8KM94l3CKdRhaImzgVlDL0y6X2WUiCZdBdC2xqt39Ly+bciduNg==
X-Received: by 2002:a05:7022:ff48:b0:119:e569:fbb3 with SMTP id a92af1059eb24-11b41202561mr8666793c88.34.1763405099907;
        Mon, 17 Nov 2025 10:44:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b0608861asm34401377c88.9.2025.11.17.10.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:44:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Nov 2025 10:44:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Reznichenko <igor@reznichenko.net>
Cc: corbet@lwn.net, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/hwmon: Fix broken datasheet links for
 zl6100
Message-ID: <7f2d0d77-5335-4639-8db9-7982eeeb5bf9@roeck-us.net>
References: <20251115182908.1357793-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115182908.1357793-1-igor@reznichenko.net>

On Sat, Nov 15, 2025 at 10:29:08AM -0800, Igor Reznichenko wrote:
> Some of the datasheet links contained .pdf suffix which resulted in 404.
> This patch updates the links to the correct URLs on Renesas website.
> 
> Signed-off-by: Igor Reznichenko <igor@reznichenko.net>

Applied.

Thanks,
Guenter
