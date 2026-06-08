Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5462F872
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 00:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780878797; cv=none; b=X1rxcboeZMfUAI2ExLCckoC7wnM2rRcJQmdqyexUiJkcTZJI3BewP6IET3qR9+lJRtVXI2kes/3GDy60NwWrAH7H4MmQ/G+oaPH2+kMj+5vpeEJkJexUChPYIJuF2KU7LqSBks9gsenKxMSpi2FmXE/uUXltBuvb+Syiu6z5m7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780878797; c=relaxed/simple;
	bh=DCN2dixGveWJ8JBeiJV94aW7x3ZprGIEEJJO+J1UQDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgdXitrBUpRbYyquSHRmCxh8gvT+xga6p+aWKrT+olParivbrWwncqsTv7IwWiGyjDlV8g0rvb23RxijjVvzu1WZtiqCnlgur5QsbErKwPKfMBE+rZjb+Vzq7hOHxCJRmI9MgChG7SOPZ0R7xZw5m4BvDSOfVkyDoTugHIbeThE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CD0NH9SQ; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CD0NH9SQ"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1370417c01cso4960335c88.1
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 17:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780878795; x=1781483595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIOstC8qlFPGk/t627biNiR4nt5ZUsFZR6LOUF+Z1M0=;
        b=CD0NH9SQoHjxHC7S7SyvKw4vJkiv6On1FaaEfjEdvcacV+rfW6uOBbNzhAV9TznGDO
         pdQpK612rVgrEmK/XFLNpBJL2++XG1bdCdN6KqbItq/WCR+oOJXYzzEj3bVks6C+sAaP
         yKC/06gHLiC7p2p2yPWCxdRWHxfTWtYakYYJnv59BUoByLiTRZWJJblKKTobDuDZgtNL
         jspfDTBNUGxnNtYPWqb1M3k1IiOjyXStsvH6B2mMSBfwE4d67d7HwkB5ESXvjPc0xh+U
         1bMiRdGChHJeDYvb2ogN/Ys4E860X2TgJDqOxcIhMbZX6yCdOTbuoxTG2vXo/XsTX0yo
         reNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780878795; x=1781483595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EIOstC8qlFPGk/t627biNiR4nt5ZUsFZR6LOUF+Z1M0=;
        b=ests/l6TTyji3dRb5PhjYreOK5/TFH/OXQDQbIHMsnmPCah2JpG/ieGIb5CQaxU2Dt
         jktzxML7HTzVB3WWK3T9x03Ng2SqnPsKthI0kHe4QJhu7P9cv+NNTJn7oV345NxBu3F+
         bYAAHHfQQEjUJY+0o/RVBTlOR/G7XF1C7Q2Xl8aNIix9taOy/5ooeK+OC/K336sidOgy
         1DqsFbfWM1YRS/Rbk1dDe0/EcUiu/of/0by7Uk+eVy6gDqb0AF8AfIzjSIe25CVYMBPf
         1b7snp9x8llc2ossl+3UiYvw8VP04eNOMUTuMUzRAsJt4YofEKxBuPl8W9gl0Pe/0RpA
         l94g==
X-Gm-Message-State: AOJu0YzQuk7RRx5r/c8EFZzUeSMkWlxl716/8tznh4b1GyFMFYJLWzHG
	J1SiD5w1BUnVU+YJNTgo1qrWtAwjBFNMQNJp0Hq4z3Sl+czHSGeJBd1kVKJvI3x4
X-Gm-Gg: Acq92OHw6z6xu3WJ+gesNKdwCy58ofdnnkMkafjKfB66CLWk9v0zrmVUQ93yDLAT2g6
	ZTi/7QerxP8XlOZ6vmuul5sMeKwO5ShKxK3i4wYwC9xHMMt2Oi8wpVK9GXR2wr0dEua6CAX9QgW
	wmw+6wpt1n92aqmeCZ0Nj3EOttUfkVZ18TDa2D8f1A2Xkg2K4mC1DigyRlrE/uarsFriM4cWAjK
	Vne2wvxNDuYGLxzfu33Qapb0Ox8LEldDAKyAXmLRcvHDytqEhHcr19AwDB8Ahn7q6N5xjPFFNRj
	gygXJiCfLlXTryDpbawg32kVI3Fd965iqjQGeg/gRPt8dfR+9FtUVu5vDHaXxudDxWaDZf0cxV/
	XtD2eyua67ymvcKBHi7Wg04qU7Z3UQ9XhfQ/RGyb+R9PyZgNm+EO9Y3ZocT22J94f/CYq+XbHXA
	zYIHnbn2G/SFNjaXDfJg2jv8QTl3QT4WZyIRdo5L/PKhOqDhA=
X-Received: by 2002:a05:7022:103:b0:136:3520:7234 with SMTP id a92af1059eb24-1380667a022mr6697312c88.12.1780878795258;
        Sun, 07 Jun 2026 17:33:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5550bcdsm11421111c88.14.2026.06.07.17.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 17:33:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 17:33:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Nilsson <linux@erq.se>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/1] hwmon: (pmbus) Add support for Flex BMR316, BMR321,
 BMR350 and BMR351
Message-ID: <91719187-e4e2-4303-9b39-b2bb924ec507@roeck-us.net>
References: <20260603085712.659432-1-linux@erq.se>
 <20260603085712.659432-2-linux@erq.se>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603085712.659432-2-linux@erq.se>

On Wed, Jun 03, 2026 at 10:57:12AM +0200, Daniel Nilsson wrote:
> Add support for BMR316, BMR321, BMR350 and BMR351 DC/DC converter
> modules from Flex to the pmbus driver.
> 
> Signed-off-by: Daniel Nilsson <linux@erq.se>

Applied.

Thanks,
Guenter
