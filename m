Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194FC405C1
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Nov 2023 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+aWWTpu"
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9CFE1B5;
	Tue, 14 Nov 2023 05:43:17 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5c08c47c055so43557167b3.1;
        Tue, 14 Nov 2023 05:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699969397; x=1700574197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKssecnQulv+h/1FkfTF0bOJ419rQJgy4K5iCAIDuxE=;
        b=b+aWWTpuZbhVdLh9qenuynG7aTxUyd/eTz1wsYBDCL6404AIIPwYoIMRXQLresCu2N
         eUHzJa03qaDYKR8LzB4OVevFKVpkvRWka/+lmbvc/XQxAvSR/29dOFlfEdz4AU7BDqBt
         iZn3IDZCrqzCUI5n9Elc3IGt5ls9xuYGSrSt7IumcgtibaVYolmZtifcN03k9i9c4WRX
         3/KcJafdy/ChT1bWbHAsWKxzgX7w5O8fgniuyVycA6frmgkHIj9Mjvlunz/QV4jUgGVn
         dxNC/YPjXNwNXCvxTrVZ/0qDHrWkbFeiGSUS/s6b2x6QJETw4NSkoU6MxTcPFxp8+2K6
         T5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699969397; x=1700574197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKssecnQulv+h/1FkfTF0bOJ419rQJgy4K5iCAIDuxE=;
        b=YSd6Xge4/f8XT5tOKAfYZZpVdbjU3AEH6y02AI9FwyDqdZLV/8o3munCjRiBWA07ye
         yjeHhMjPBNW//uTMYO6sWKf3VZ1wzVfaF0wN9oFAt157vOSrENXzM7D6L9czoiPYtd3j
         DYFzER1mJ72YFY/DtH//wn9mMjuTGBR09NORbfGxQc6tvnsK50gWxHU3sAKtApw5RjxF
         fVvavOOStFZF4kZfpM5EF+oiYp4I3Ng6c5Kz0JFvN8iVz1EnVt2s/7MP6SHFq9qUgQ/j
         H0R5+RVrVp/9mYoX3V/NvaB1to94inERO9eXX0UYWXB5qRVMV6KuJZD7LIPGprPHQ394
         uAsg==
X-Gm-Message-State: AOJu0YwvxkVsWEHoEZqrfscsKycVyn7Cg/i38j1W1THd6/iKkZhQLRhJ
	doZh9Yb0wmHsjhxNsfZAnI3cQLjegFg=
X-Google-Smtp-Source: AGHT+IHewTrmjIn5UoDTQ9uZCmmfj5bUUYkLJq97ArHqkopq07q8yETveAzh2PrL1Hut4ABM1isAtQ==
X-Received: by 2002:a81:4915:0:b0:5ad:7fc2:4787 with SMTP id w21-20020a814915000000b005ad7fc24787mr9716484ywa.15.1699969396788;
        Tue, 14 Nov 2023 05:43:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x15-20020a0ce78f000000b00668eb252523sm2891094qvn.63.2023.11.14.05.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 05:43:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 14 Nov 2023 05:43:14 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] hwmon: Fix some kernel-doc comments
Message-ID: <c998ed80-076f-4de8-b281-14216d752134@roeck-us.net>
References: <20231110055341.39939-1-yang.lee@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110055341.39939-1-yang.lee@linux.alibaba.com>

On Fri, Nov 10, 2023 at 01:53:41PM +0800, Yang Li wrote:
> Fix some kernel-doc comments to silence the warnings:
> drivers/hwmon/sht4x.c:65: warning: Function parameter or member 'valid' not described in 'sht4x_data'
> drivers/hwmon/sht4x.c:73: warning: Function parameter or member 'data' not described in 'sht4x_read_values'
> drivers/hwmon/sht4x.c:73: warning: Excess function parameter 'sht4x_data' description in 'sht4x_read_values'
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7220
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Thanks,
Guenter
