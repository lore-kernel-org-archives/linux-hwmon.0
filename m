Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E0F405C2
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Nov 2023 13:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndMYdRBh"
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA1E1994;
	Tue, 14 Nov 2023 05:58:01 -0800 (PST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1efb9571b13so3448510fac.2;
        Tue, 14 Nov 2023 05:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699970280; x=1700575080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tQ/w7U1rEr9pNLfzZT/Ukv2lbglG63Hd24Y7omCEu8=;
        b=ndMYdRBhuGzs5m5r28ytpRzeCtq/wT08uE1WROpgLj35wkx2BYuGGzGqkvCAKK//Oe
         JdRVIqA/t1+/Ud6AwnfUvody+0anHf4qXmJLeQi2tGF9hwvsFLTWB9rLATzBxOHmQQeX
         SbtUJtObHIEMN4w0DXFbffnR5u4WF61AkZbw3679UPS893bHBo6m5GUZiLR+i5CcanYg
         ZWVLepKDJMg0W16hR+PFSOq6ocbmh4W5HTU/7deDNuvsa1nbXQKbkgfla/HjGkNU/jCp
         niSrSoMxVdrbzjXDXHI/Uum5e3Oj444D0vFlgj9iW6b0jRFdO2AlOaueNLFo9K4Tr9Tw
         xFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699970280; x=1700575080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tQ/w7U1rEr9pNLfzZT/Ukv2lbglG63Hd24Y7omCEu8=;
        b=rYVUQHwxAKVF2jviGDxXLWEoWaPBiFp2m0w3TAte5CalkheOU119CaJMgoeL5O33ru
         ta8NtvtVXSN/jzqPpGmMAFAQf8wUwgCwT9GDbTWjGCwhLRW2WXKJGFYsgWicpR5/MI3/
         7ifXh7/2WSaaul6p6WfNVy1HBiu5OvWcvcwwvWFJMUkdSY4wQ7IScKb97mcsIJjMlI1C
         1R9OrVrmwPjXZbS1BsYqddzSliFHp0UyRxfDSKgq0jUA7WCdSK1XvZuAjy2AzqIcdiu5
         lSNKdGvLZCSgSC7lob6SXt/JIARpqSq1nlPZmZIoOH5cpElhoT85i19tscod646BeOHL
         53Yw==
X-Gm-Message-State: AOJu0Yy4ruQSG5F51IZhIldWwgoKRhfpuUz1uHv91PKNQJPK4SnbtmDj
	wW1mBt93uJH3amXr68gnJnPyBq+LYOA=
X-Google-Smtp-Source: AGHT+IG2kwx3olSWgkhoI21eWtGCUJjtnOwNM1Yb0dfCZ782WdZE4B0kmJy6laSkiHWN9lbI0DZggQ==
X-Received: by 2002:a05:6870:1494:b0:1ea:bb5:a531 with SMTP id k20-20020a056870149400b001ea0bb5a531mr12651796oab.13.1699970280553;
        Tue, 14 Nov 2023 05:58:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k21-20020a05620a07f500b007759e9b0eb8sm2686217qkk.99.2023.11.14.05.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 05:58:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 14 Nov 2023 05:57:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Armin Wolf <W_Armin@gmx.de>, pali@kernel.org, markgross@kernel.org,
	ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] hwmon: (dell-smm) Add support for WMI SMM
 interface
Message-ID: <149a31b1-f5b8-438c-8883-987cb4224944@roeck-us.net>
References: <20231106064351.42347-1-W_Armin@gmx.de>
 <3ec0496d-3b89-46f5-9faf-9fcce78f6b38@gmx.de>
 <8c25dfec-b0ca-4e2f-964a-5ae62452e141@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c25dfec-b0ca-4e2f-964a-5ae62452e141@redhat.com>

On Mon, Nov 13, 2023 at 09:17:48PM +0100, Hans de Goede wrote:
> 
> I plan to review and hopefully merge this and your
> other series sometime this week.
> 

What warrants merging this series through your tree(s) instead of
through hwmon ?

Guenter
