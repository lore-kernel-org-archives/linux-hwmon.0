Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413F3F9CB
	for <linux-hwmon@vger.kernel.org>; Fri, 24 May 2024 00:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716509513; cv=none; b=d5djRz+7+HRRC8Buj+beYGVPrtqhgv07xaDGNjT/sysQM4PTIKG79lStfWWfcJwz0uMjS/YVEoUCe7XOnKQjrzgnIfQb7LOHiLjhJsJodccZhsJMAEimD4bqS1VO+rr48XRnfzE+VzrMWIps+pVOR/SfrGftrPELTruUgd89n0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716509513; c=relaxed/simple;
	bh=nRc3WeVZE23gV4AdRevK9ZlxzsxL96l8XoNG0zG8duQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p1B685cw1dMOn3ktJi+qutWV/o4t/MARazrpnWnqiRyzvh5a7sMsZQ2hX9k4Ngk3h0DuY2xTCeNo1EjnYisKwEHdTZRcyShpc46WEIbaE1lEnINlVry6c2c533NA6TQqA0Q/bL3pt90ecH1JnqJ3YN7eOZtPpH9leQD63imOdEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8+D01h6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8+D01h6"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6f8f34cb0beso197658b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 23 May 2024 17:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716509511; x=1717114311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HsYpYM6k1q9KRoo66EjHosICuhvty0UdSlCBqm1/AKo=;
        b=e8+D01h6NzPQoKDAKZbfIJBJl6ohXU63I/zX+RQ8AktnafJEbf640dRU7WvjgwgK6U
         tDSd0hdpC6Qpo6P8WmocU86ugUcRQHIbzD1Dr5XC3QiXkYEsxDe2OHKKFi5PP/PCESQG
         P9/nBUkKlikAOlpLp2CIT0tFUVTBMrUGBO08cjvpTUXlrU/9AEijnqg7qRGG41LgIolb
         nzNRiwcuYW+NuDlcjZSWCJOvULVtgkpRwAUjq9Y5yVP3PF4uPNp+EpMl5f2OjH6XrAj2
         gDHQTeIUJJlzOImmVMXQ5uK/JAhOSp8Ji4s0JqeGeRkzTF5dNMA440BKcJKyEpgRjtro
         NAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716509511; x=1717114311;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsYpYM6k1q9KRoo66EjHosICuhvty0UdSlCBqm1/AKo=;
        b=or0uvwXkgm6av7P3Gv9/LhRf6pjJ/x1pfu3FWspRK03wbLBRXf5fFmBwGfADkBZlnx
         WS3do+b6up/0c+ibx2HQShjefgg1oo8ixi+CMZnxHdFrG5xpScCCaDjY8wwFDf/N6Y6m
         GZ1PVHohTPV4dGcxB+jBsuv9GG+L6n25cZcRz1ddHgKY1BVumz0J7F78PpiIwoTcuRzZ
         uzz1uHxH4VgdIqXA25EwUIou722gJw7S1egsi9XKtZVyp4pRK/ZTXNxKpaC4S0kXglJy
         Sjk/KyOyUiQvymncVy0Oy3XpxtysInXv8faYRV6gG3q3rHBKPgy9njPbGni94lCdp6eB
         67aw==
X-Gm-Message-State: AOJu0YyYzo+yEvJgO0y5waiLh1gO8DQs1a3/g6fB6H/1IlNlkt1MkZ8y
	QaCPOColfO7ulGT6BafKEg0/B/uaJOiuohWg2DiPy9hvjz6+plHomW7KVw==
X-Google-Smtp-Source: AGHT+IErAnDF9xhe4FuAXv/whEJymOOqD4f9fBs+AG1d8yp+Fe2lffCWpc8HGfXmAvyEBOmu2Qxg4g==
X-Received: by 2002:a05:6a20:6a1f:b0:1a7:590e:279e with SMTP id adf61e73a8af0-1b212ca8662mr1315648637.5.1716509511533;
        Thu, 23 May 2024 17:11:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fcfe6694sm167435b3a.152.2024.05.23.17.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 17:11:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ed3ce9d7-7f51-4c13-824a-66e90cf46dd1@roeck-us.net>
Date: Thu, 23 May 2024 17:11:49 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (nzxt-smart2) add another USB ID
To: Aleksandr Mezin <mezin.alexander@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <20240523203130.75681-1-mezin.alexander@gmail.com>
 <cd58922f-711e-4125-8214-57e1f83f6777@roeck-us.net>
 <CADnvcfJK7yuQvQyCu4Sjtgx4To05yanf-ibD9++DBHT+v-gDog@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CADnvcfJK7yuQvQyCu4Sjtgx4To05yanf-ibD9++DBHT+v-gDog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/24 16:34, Aleksandr Mezin wrote:
> I'm sorry, I don't understand what exactly is wrong with the
> description. Especially because patches with similar descriptions were
> accepted before.
> 
See Documentation/process/submitting-patches.rst, "Describe your changes"

And thanks for pointing out that I am not perfect.

Guenter

