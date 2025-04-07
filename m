Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C4A1FC7D2
	for <linux-hwmon@vger.kernel.org>; Mon,  7 Apr 2025 20:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056305; cv=none; b=o6eVa+LHggwP9ngQLepsVFS83IyTrQ4KGk7jSrEsz0jymBxTe87U/NeasSYG7ewGSVXWIm4RYrj8B7/D1IZGsJfzv/EeNXEQdSX18lNOqBOiiyOl7l1YE5ktfqOrZtsW8E1BZzRr5UroYzRkMSAkiWq4dw6E9gkvYiUfF2eFnDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056305; c=relaxed/simple;
	bh=fm73ijbA4AEhWXK9NGxQM7eAAsPeIxu3JLQ+krLfZx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3cwe0bQAylk2H5jd6gre8tJFRcOiAYLlc0BRpA3d6DdbjfKQxoQdSrctPSqp8heLwJBDKdpL9tspdbcxAYFSbgaMM/ljfhsVUixz1Wt42QMzAWzXqXc1Aqjroivx9/OPw0UqJzZ9nIpHzhWPV/Lh1QTahHXTwasGvkE2f2TLm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=RRmnUKe/; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="RRmnUKe/"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so7277066d6.1
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Apr 2025 13:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744056303; x=1744661103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fm73ijbA4AEhWXK9NGxQM7eAAsPeIxu3JLQ+krLfZx4=;
        b=RRmnUKe/T28jQUWp7c23qKeB6ac7OvjHRc/7BrOsUqUK0g1un9FuG8Z1b8xzU6Bdhf
         aFAS7UVl6bqPWbfsVENMArDhs61usHkaoS39CQ01NaqwCXhuO+69yDZOBouFDlA9/de1
         WcKcxPH+eifumw553IiY2J4CQoYbRiZzugf4P+3pZuv1kn8fUSV9VjoOXtHtZeNKYVg7
         Wl1H37e1CzJkHNIB+jh0RKRxbnZMCJDSmsaSIe/FLsNL+q9R7LAzTIgMuWJuBFFQx5Yp
         gYRXvDs34qd2jlSXXVKuswBsSUGbIYTogNch5FMvf/bOsxNe7D2ZpAOtiFL/ymvbnvWo
         FjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744056303; x=1744661103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fm73ijbA4AEhWXK9NGxQM7eAAsPeIxu3JLQ+krLfZx4=;
        b=Ky+lPKK/2+Gnzsv8guNujQkqHZEMDfhnjGHYVup6rEPijMBx1gG73zkzNcdnGUTccC
         q3bqxlZM3sIs6jKu8BlKlMoNYDGa5F6tShBuijMxFROgBwtcLtgltCFbKk1LRfjyvD3Y
         BDblDRIU1Ksjwg3aJZ2z0hZDwZd5aQrKCCznm0ewdoCeoeshQnk1Ri5O9iO8xxiZUcXY
         g20akO4vFTe8p6AExe552EfwgYon8r2ahA/sRmWpn8q0cNHvHDHC0STQQe5soFLvg27i
         vjnKECcD121UgBOs7EJxpHbNodgJ+7y30sSbe9qr0fL9sYINhZ8FYPe11vXLB3MDwN8y
         Bo3g==
X-Forwarded-Encrypted: i=1; AJvYcCXSg9dCtWPtl384mT7ir9wVDwqV29ghOyFSpLQWfe/L8JUWLTg1dxcfYIVZrscwCJsSNlyGfIJOPTy9/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk4sE83ftdAQcSEM3cgB0yuQI+1sY+fY6RTJpMyUqG5wr4jnp4
	MxGqH9TJeeBGW6LTLpO7S5tVpnnRvPaYfeP8fo7jQ0/HdrtXTxZsIrwWXTMMCMTWjMnTabojgrL
	Fe/j7tYlfmDO6TdziX+v5PmHC1V1BeJzZ/Rl4WF8OUdWtOYBnjiI=
X-Gm-Gg: ASbGnctKYd8WeOhYllCnmgikDYqB1dPOh5Qyzh7+n+4i/kxFZ8whhWZIPX/2DFG3d7B
	6j3Z5IK/fIgQzaKJaxhPkSNMmXlOjOjd8UmmZNloPfLplkwSemGwhllbzUBoEqCZV79tsZka1jV
	a1z8Q6Y7F+4SoF8VW3l+3jpfKqenF5g0Yacq7k4D67cflSByi5JL0qVYz6buPE
X-Google-Smtp-Source: AGHT+IFtx6dT5DSs3sTterG6CM1nKdqGCIiyPeM9wRE0wJgaTgDILFCrLS32GtEnAfJmptq3sO5lQq/wSnSv9pf2Juo=
X-Received: by 2002:ad4:5bca:0:b0:6ed:1095:e9d3 with SMTP id
 6a1803df08f44-6f0d254f9c3mr10640966d6.14.1744056303132; Mon, 07 Apr 2025
 13:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403211246.3876138-1-william@wkennington.com>
 <20250404193103.4174977-1-william@wkennington.com> <295ea363-dbeb-43c6-b8b3-3992776b84c0@roeck-us.net>
In-Reply-To: <295ea363-dbeb-43c6-b8b3-3992776b84c0@roeck-us.net>
From: William Kennington <william@wkennington.com>
Date: Mon, 7 Apr 2025 13:04:50 -0700
X-Gm-Features: ATxdqUHQCR7kbQwR_HHylO85SDnwjBICFfQfX39-VfWHJyd7A0SEVwKQP1JYsKo
Message-ID: <CAD_4BXgx0Np8XU1afhybtC2cTUMYPm1ajiT6F3S3Gk6RGmVZUQ@mail.gmail.com>
Subject: Re: [PATCH v4] hwmon: (pmbus): Introduce page_change_delay
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 6, 2025 at 10:28=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Fri, Apr 04, 2025 at 12:31:03PM -0700, William A. Kennington III wrote=
:
> > We have some buggy pmbus devices that require a delay after performing =
a
> > page change operation before trying to issue more commands to the
> > device.
> >
> > This allows for a configurable delay after page changes, but not
> > affecting other read or write operations.
> >
> > This makes a slight behavioral tweak to the existing delay logic, where
> > it considers the longest of delays between operations, instead of alway=
s
> > chosing the write delay over the access delay.
> >
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
>
> I tried to apply your patch, but it fails. Please rebase to the upstream
> kernel and resubmit.

Done in v5

>
> Thanks,
> Guenter
