Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItyZDgI3"
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C9F49D0;
	Mon, 11 Dec 2023 06:16:00 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2886579d59fso4407815a91.1;
        Mon, 11 Dec 2023 06:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702304160; x=1702908960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xidirTrxXnNmG0JvKz0tJiRl9A5fgie8YXkr2qojzMw=;
        b=ItyZDgI3FB3BEhznaiWb+iZBB1MyVVAKqfEg0R+XlP7Ia/CpdrF5cRvcvztoHdz3K1
         HcfcZhE6oIW8bbu0PxfwIa/bGSdRtY4+PcGPJSTjl364qnK7vb4en0x7gRMkvLYfrnWM
         1geVbSS0jG8Ny91cXYtgEViWxY2Jlkjz17739bElRcPnu0oI6m9lZNYrUi8KkRx1YYZV
         A/Gh29jrz5kbKjmll7eW0ri6szchZvZdos+d7l+oQoo7R73/kOfzSSmr6lGbWn8Gcwpk
         O8AkdgFAfJmhW7Y1iFdkHKSZBAOhbTvBeVY2Qa+iXIid0hN13MohOR8q3wIB4dxLhB/Z
         xbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702304160; x=1702908960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xidirTrxXnNmG0JvKz0tJiRl9A5fgie8YXkr2qojzMw=;
        b=cq7VmbIlNVSchvLTwRi0sZzVW5bJ5Ge/mBKggRI5jD/ObXLOAB+PAvzUl67VTLjN6N
         VoHifKc2PsTH30D8GzSA64hjABBNLp5LZW4Iv4e/+UVxogCasq6abrUq6/5vA92gd8Yu
         YrNtft0FkKnP0W8lGnz/YDq2YR/aFQxGex+88z8JSXDg3yFROfB2YWDsoPubaKZqaY02
         3BMIVJgNzmaLWkVs+DW+vaOr2vdzg0K0rRlijn5Ns/IYN3zMQS6uhSVd/F86Jmqx6XfW
         BDlBH7srTDv1hdYVm03h15NpZrXSovN78IQ1Cs4lnSN/ktVT+RPKWZMpgJOf+Xj6B/Ln
         NGYg==
X-Gm-Message-State: AOJu0YxYiTm85baU/GK/y8xQFo1G2o8SD8yuToubDLudPda7eFPHeBr4
	15zdoOLbjuCEcg3sD/oTGUk=
X-Google-Smtp-Source: AGHT+IH0WXagXgVuJh/SlrzMlkhD5V5Tt4h+uv5dL8ESmjBVsqzSI/DJzQXA7+bylhPcIsqFOO4wMg==
X-Received: by 2002:a17:90b:11c8:b0:286:6cc0:cabb with SMTP id gv8-20020a17090b11c800b002866cc0cabbmr3414899pjb.50.1702304159636;
        Mon, 11 Dec 2023 06:15:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s3-20020a17090a698300b00286920600a9sm9259924pjj.32.2023.12.11.06.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 06:15:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Dec 2023 06:15:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Matyas <daniel.matyas@analog.com>
Cc: no To-header on input <;, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/5] hwmon: max31827: Add custom attribute for
 resolution
Message-ID: <3b55f462-a52d-411f-8151-bd73ad5cd4b8@roeck-us.net>
References: <20231031182158.124608-1-daniel.matyas@analog.com>
 <20231031182158.124608-5-daniel.matyas@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031182158.124608-5-daniel.matyas@analog.com>

On Tue, Oct 31, 2023 at 08:21:57PM +0200, Daniel Matyas wrote:
> Added custom channel-specific (temp1) attribute for resolution. The wait
> time for a conversion in one-shot mode (enable = 0) depends on the
> resolution.
> 
> When resolution is 12-bit, the conversion time is 140ms, but the minimum
> update_interval is 125ms. Handled this problem by waiting an additional
> 15ms (125ms + 15ms = 140ms).
> 
> Added 'mask' parameter to the shutdown_write() function. Now it can
> either write or update bits, depending on the value of mask. This is
> needed, because for alarms a write is necessary, but for resolution only
> the resolution bits should be updated.
> 
> Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>

Series applied.

Thanks,
Guenter
