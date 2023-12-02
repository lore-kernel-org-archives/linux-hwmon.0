Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYe76WwW"
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D8E184;
	Sat,  2 Dec 2023 08:02:15 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-332c0c32d19so2616398f8f.3;
        Sat, 02 Dec 2023 08:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701532934; x=1702137734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fU/NEbx/GEWzCAUdmHl+WjvtDDH/8BWmzFN7WY12d78=;
        b=aYe76WwWtTKIIfzv1M1xzazBwXQogh38EoMnXgtsupOGvV4KmyMMWz8uWAN/gBEVFT
         4JBPMVqKQsGT425gtOGEj3O64wnfhIzvOGMN3PC52j1ZXI76RxeTBxd2y3TgrjB4I4eU
         Q2f2Tp5nOYBHgvi7MZBq7RdLr5va9L4wYlCaQxwt9xxfV1SrBCGIA7GCrG++gGlRAjCX
         RJ0K1PrONn8ua7nvC6WLH7gUwCom+Y+Wx7FCyzQ9MFK9tzlQDe+/GdhVxXQcDeKb3FsP
         nc3Mz0UZWEIq/PbDi3HvtGkuYnjD8HMFgX5UW+TGZyi/nnM0SKCH/hJmKvn4Nn2eW42z
         CtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701532934; x=1702137734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fU/NEbx/GEWzCAUdmHl+WjvtDDH/8BWmzFN7WY12d78=;
        b=JesyeNbp7+Hbue1QCZ/ATL8X4iuGhcEl11ugDpFq2MzHRKLZeAUA+wKAHikc+vAdVX
         qi3P2BWXUyiHVYzZ/ic9oYybSdA0WtZbHnSNjMJVrQ7L2wbdF4y0P0zntQsLMiKq0fyd
         n/KFeeQtFOAGNM/u7w4qYDdolZomYcmI7HqXiJ0ZEImt4hO8fkQJ/EhRaIZ8e6DfFQzn
         qlfRwIi8ldohVzUVI4PEAs83taEqyZAPcg78UkI5+AQPANHCpxwU9GO7+hteHa6eCfFb
         nh5Hbm4PBdeRbx4Pn9xVGpW3Ti/jVrU1wlyySKsS8d4msbVuvhejb3MgEfFpOG+vmlmP
         mVww==
X-Gm-Message-State: AOJu0Yxf4jcKCqe6QBULX+uYVivsmw7K23gHl1UL0STxZfj9/GgSFz9+
	lhhO59m31YFgu+vVFdqg+jOl7E9cRGUZcw==
X-Google-Smtp-Source: AGHT+IECoTdcNwtXWz4lBnf7PIuZVcGneQgOEFSxQi3wRpiUqSTAaeOpfhb0b3A0AmZWdsw1yVpS/g==
X-Received: by 2002:a5d:4dc1:0:b0:333:3ead:54c3 with SMTP id f1-20020a5d4dc1000000b003333ead54c3mr296492wru.97.1701532934065;
        Sat, 02 Dec 2023 08:02:14 -0800 (PST)
Received: from [192.168.0.28] (cable-178-148-234-71.dynamic.sbb.rs. [178.148.234.71])
        by smtp.gmail.com with ESMTPSA id j6-20020a5d5646000000b0033307ffb193sm7157180wrw.29.2023.12.02.08.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Dec 2023 08:02:13 -0800 (PST)
Message-ID: <9d453ea5-e2ce-4559-a611-714ba0201e8d@gmail.com>
Date: Sat, 2 Dec 2023 17:02:11 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: savicaleksa83@gmail.com, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: Add driver for Gigabyte AORUS Waterforce AIO
 coolers
To: Guenter Roeck <linux@roeck-us.net>
References: <20231020130212.8919-1-savicaleksa83@gmail.com>
 <45484650-4975-4f66-971d-7599681b1538@gmail.com>
 <0b76e7b5-a693-41e9-bf8c-531735c57337@roeck-us.net>
Content-Language: en-US
From: Aleksa Savic <savicaleksa83@gmail.com>
In-Reply-To: <0b76e7b5-a693-41e9-bf8c-531735c57337@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023-12-02 16:42:25 GMT+01:00, Guenter Roeck wrote:
> 
> I was waiting for that. In general, I am too busy to review patches if
> 0-day reports a problem, and wait for those to be resolved.
> 
> Guenter
> 

Ah, fair enough. I was hesitant to send a v2 outright, but will do that
soon and know for the future.

Thanks,
Aleksa
