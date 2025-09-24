Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA6178F43
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725023; cv=none; b=TlNaVW1ke31v18Q3DTx0e0VIPTHNLJ7CbCkAGYai5F4n2wdC6POa1z5Z6DzT5pd+p2hMygtj2AOVlxyg+avUd98CDHNb8I7ilahkneuoULKk0OC4/q+AgH1yldx2D0Q8bgYzlLLvPhJi9QkTqVaC6q7lrQKrl+YcH2v5oiE6cf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725023; c=relaxed/simple;
	bh=9DMfrgjN4rnqyaeNGDI+SNpIuhRxBA9gdwSamu1Ca1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBkaXmdoVLJiQj5NlD+lqq7c0k1pjVCTBBzp1eZ/HbFbQVYO2JdS906GkJWagHprQmDw/0B9znK26IDsUDuJRWy0J+Qn9ZgNeV4hZiFQ+BkLFY0UvacsP75vknSl6v0D7kcQvMPo5LBDNqNExtub1EcgyFDlDhE2DRf/WNNLU8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOo+Gpt/; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOo+Gpt/"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27d3540a43fso22127185ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725021; x=1759329821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoQIwHnAedYHW2ZwTiTqd0HfpwsJi7a/PfALZCLVmnI=;
        b=KOo+Gpt/Ro6bOAO5JM8VRHLhBTB6kJBuhy2kYGwwoM/gHsTBdte2+MUIbHj2tv0YuT
         Ym0TpHtBS1oWaRO8Xho5sPTQsiSQS/vB851JPOlJ4uNbjxEXkSDTTuxnD5mumDsw3gHS
         s0tdmjy/z/G8zQBvTKkGUUhvK1pZ8l7WNq2gAYNPMfhtvd/bep23wc9vF6T2aJ2+EgNg
         iezq3un2hgZibhc0RDbmM8WZE6rO5jCLdsWUed2K745I3IfAnInp0qAr9wY45wQ6QXiF
         FDs2kgLdOP97Cy8bkM6Owem1Z+tqSWxsm2FRKw2jI06lrhcCNUQU4QmrEQoyk5C800VJ
         9FJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725021; x=1759329821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoQIwHnAedYHW2ZwTiTqd0HfpwsJi7a/PfALZCLVmnI=;
        b=ORZcUdn3NGTQ4rDYFqr4V42Mm8vjiXHqAWmJb7+WLEJZKeOodoYxLqydcd6wmuvOaa
         3KcfFdy63lAP8sOzuuPpVa+1oZ+ZSnTbVP7btQpLmNawRRimJaJnypOr+sG1ljw56w4T
         kIZMRqrsxIwprEXnec3MRJVwPWeCfat9/XB1IhUAOQykHCcF97HLkzMcXBQuVoMGN7qQ
         BDIutmw9dX0/5jXJsuSpAhm/5B4rL4iaXNSsPcELtNuRxKWnaMegFd95KWH0PHL+h+TC
         jHj0xSNfT7n/S5KPbMH0CNZOPGUNWZvtJV5unpnmAQMFt0kNIPKR9H0mXHiPsSQ3DSdm
         CIyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsjvn109AjLqdCZTdI64zlFKoBFh0UCSMt2FMuZWro5nhjTbJZioqhLODupaDv2G6CLybI78NHEhAV4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQUU7ys08F7+Yru0l6RgM7clyoaD1qHTTuI6ZbRXQdZbMH75QP
	n+BLbpei0e5lh5rCaxKoRCGnep7DCcrqVfEHeSnDGPLZ1jWVzNPbnJ3e
X-Gm-Gg: ASbGnctD0P+HTKb1zTCCCkraMVjc2y+hAWQeebFI/U/VsPsb0+X3tFKm1Q4Jd2NIjNd
	AN3jHfix7Nwj5qXUHkLI7Fkc1P2zRbbkWbEvOtKOAtTZQU8yQosaVEF+Fu+1qxUkDGL75FlXKHH
	DUpdlQkISqLeqfj4PFs7y7ZRk0zt544rzHmNnJU/HyTFIYQOzpG1crgcxYm4FyxFQ+v7K9XKkI8
	hYFzacI6iFPUIMOMKSd9CcU1RYP7LZnqxvDzNC+hzHqlzohxWMjJjAJg7/GSVbklXlaW0Sfrq4w
	t6LFM419KCbtWo3VzXMLZHq71VdlNO7YSPaMOb6GKkhl89iVbBMcP9q+dlYXmzLQoQ3o0JyRFrF
	vAjyujozKUPo7SbpdLLqRfVoWJwuJYmBOkqQ=
X-Google-Smtp-Source: AGHT+IG1t9g+PyWBTNNv9NJLqG0nvrC6oN7qO1dddwsct7J5ksa0J4Ge5ZLfMucYl6Syn9hATvxiLw==
X-Received: by 2002:a17:903:3bc8:b0:273:7d52:e510 with SMTP id d9443c01a7336-27cc79ca30cmr79439065ad.58.1758725021176;
        Wed, 24 Sep 2025 07:43:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bdbf1c5sm2665309a91.19.2025.09.24.07.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:43:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:43:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Shane Fagan <mail@shanefagan.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X670E-E GAMING
 WIFI
Message-ID: <12ab9197-8894-48e5-9d4b-4e516c3ae972@roeck-us.net>
References: <20250914074125.135656-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914074125.135656-1-eugene.shalygin@gmail.com>

On Sun, Sep 14, 2025 at 09:41:14AM +0200, Eugene Shalygin wrote:
> From: Shane Fagan <mail@shanefagan.com>
> 
> Add support for ROG STRIX X670E-E GAMING WIFI
> 
> Signed-off-by: Shane Fagan <mail@shanefagan.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.
Guenter
