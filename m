Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B4D38FA3
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496464; cv=none; b=JKOSuaSEgPmesB9I4Q2Cjj9t5OH2b6EEEvV+cA2W7WinmLJFdYBzEXXjK8utU9F5NQcgw8K66mDcuAXj3t+oEwPMadud2TP+P45B2P1Z8sKqYxX1vaxj7eWc2O7St0+/r5rPYUDAe0l4hmeh5g8LdcsZdt+plm3PGh5Me0Lwq+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496464; c=relaxed/simple;
	bh=zRdpXxa8sRlKmDW74cmKW7A4LibiIzBz8wBHvqv+3vs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IvofLmu2N7VIl9nhnMTjuZ0YNQAiT92Hc/uh7Dvhgbdpd8U/ER3aT6/5fAxeuPEDUE+TaCt75jJL5ATWsdDlg7Kyv2XCU3d7nm7f2Z/lnnEmIRFW0dhfOb2hsYdTdrLtnPnWt7+XB0poOox6ZRzg2i7aYXiZFR9UDmOSE5Lfik8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Elup95n2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Elup95n2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-480706554beso8702775e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 02:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771496460; x=1772101260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9Aeee4fKBaZUgGNALNVTSi3OJpKpNywlNVD+fZAgpk=;
        b=Elup95n2m+Rv0krgZupmrFRsBGEg86Kk9HjCK7RLylvXYBB1lZ1Dvdsi/dPdX0bM5T
         0kTd63iucJEAzghbIOhkwhBfi4fxwoeMcql66cNzQaui6A1GBW6HkfuzVVLOW/+ZAjnU
         FIfKByKQyvkFQ7t3JjvYH+tMETL0OIHVm2CnaEMgZlWE1OnPsFkrWFxVCzSCEXUKRFvL
         1cTLDInWXeAIrvac0W0S6bNM0x97hhNG+3H+cYnI/nzDu3q3tM8wQyq5rRaCzaPGU+dW
         /WDQh1QRsJOaJ+8g+zi5kbqTc/gmw/tVAeyAqkMNUhOxnu5ary3i67V1DQ+Bb4PipJ6Z
         i4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771496460; x=1772101260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w9Aeee4fKBaZUgGNALNVTSi3OJpKpNywlNVD+fZAgpk=;
        b=mT5jXeDgbSstLBcxsKIVS6K5wZkXzM007P35lCQjEqwYqRFdPJ3Enpw2deEVo2SOOW
         ODRNlkZmZHAg1nLwOxn2ZsDslcIjMm1nV9jSTctAOVBL/szEfXgKZ0B1svL+7jp1FLx+
         GcMq39U4MZQNmUDHbJw8vRm1BU/cWqhn9jqx6vi+ifdsbsMVMG/XXwe/72oB1zXm8Tmx
         hRN8ZfeRza+qYpm0pmyebUXKdX+IY2X/82UfF7en48n0/vtJKyyfQKNKKngfj5/oGnNM
         kRAB/ORJDfPjJvkDuH4+DzN+8RkNMZQd+h2oCl+QWvrvdeRh/beua+BDhjjBCkqRP/Of
         TPHw==
X-Forwarded-Encrypted: i=1; AJvYcCXYP17vd9xRs46R4OVi99WVmxVuCcX20CqavY/zG3w9U2WRrD7WsRZbJiZELl7TSQjJJZ/z9kAu2HWNSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOartFATpBG7055mcpnyAuR/iItqe9NfV+Jyjx1UfVF7iCqQ5+
	XUcfDB8L4v0oxYQ9U0DF5r1AvfvOrTeLMxVD/Y/4VAN670a76nGJksPq
X-Gm-Gg: AZuq6aLQlpRNURTzfKX1j7pPrauzs2xiNSI0t4498CnPCZkqya/T2LC8VWv2gGUyAW/
	XEAO4Ra2hAHlqe9oYrhz7aSvElV1N0sH3Y0c1laufZhdbNDpm1yzY0XXsW4Xy9k2aHuvw+wyuPn
	znc7ksRxcLan9BwASk4aok+BrJeBpUsZeQ0vgRgXHTnMuaJz4/mzYihysD3xq0e95bRvW4SmvG0
	HTY4P5F1VRv7+bsCn7cfQxMdgaeLIZ6uHbAQ5jd/3zF1l2H0LgrtPB84VqPk9Ky1LNJrTHVqUVt
	B9DGtO58x2Pp7DoGchOJYkSlHt42vxcwSadinFfZbO0Pm+h23OfRp81A/O/MlEj0wKD7zgxK+H4
	TwFrwiZQMKMG0wmwElYiOfJMvZk1yhqSh6yWGWYj6arnjAhnTTuF7xiU49D77xcc/0T6Po+VIXW
	GQm11hSY9vwisGz7LluF6+TqWSx73qp7DC3g4ZK0AIWfPCb1IXIITyVDPXhkKm5Htt
X-Received: by 2002:a05:600c:310e:b0:483:a21:7744 with SMTP id 5b1f17b1804b1-48379bf6c82mr312120195e9.26.1771496459831;
        Thu, 19 Feb 2026 02:20:59 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839ea2f7a9sm22888445e9.3.2026.02.19.02.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:20:59 -0800 (PST)
Date: Thu, 19 Feb 2026 10:20:57 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Guenter
 Roeck <linux@roeck-us.net>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar
 <mingo@redhat.com>, Iwona Winiarska <iwona.winiarska@intel.com>,
 linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, Thomas Gleixner
 <tglx@kernel.org>, Tony Luck <tony.luck@intel.com>, x86@kernel.org
Subject: Re: [PATCH] peci: Remove dependency on x86 CPU variables
Message-ID: <20260219102057.1da25411@pumpkin>
In-Reply-To: <20260218170301.D814B556@davehans-spike.ostc.intel.com>
References: <20260218170301.D814B556@davehans-spike.ostc.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Feb 2026 09:03:01 -0800
Dave Hansen <dave.hansen@linux.intel.com> wrote:

> From: Dave Hansen <dave.hansen@linux.intel.com>
> 
> tl;dr: The non-x86 PECI driver #includes an arch/x86 header.  This is
> ostensibly to avoid duplicating CPU model number constants, but the
> result is complexity and duplicated *code* which is a far worse fate
> than duplicated constants.

Is is possible/sensible to add a check in one file that includes both
headers that the constants match?

That will help pick up any typos.

	David
