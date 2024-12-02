Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BDB4A29
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Dec 2024 00:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733101003; cv=none; b=FcfzOghOwjb79ogdapP4CGHiklUncN/H2u7mo/u7IP6C/cDRRlhDgaeJrB8ssAzFcTANm/zZRbY78z6x6l8r/eR6iCneqx3WMXYZW/X+r0Yg3VtRYjVMtj19aS7rHTnPMzkahj4nKRGLDS+y8Nbi6rw1moGbSr9sbrkE75+Q650=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733101003; c=relaxed/simple;
	bh=LVCViXc3Pcl/HejWyeigQOkF1DFaGAFfaFpiFP3PSYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MfY5URL/gtta5XJqzMZSJNDG4Bj4oKVY8ShMNgu4HMQbQ8PAFnA6IU3XahGCQzB++D1uowL/ojgpKulPYo4CDb35nQDYdIU6RbDDmFBeZdXv9oSd92W5Bh3vAplAobxuQzYVnkQO/fBVA6p5UP0elrn2OB8HnCQ6Q5MEqG/a1WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlVjBHyR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlVjBHyR"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a766b475so33481475e9.1
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Dec 2024 16:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733100999; x=1733705799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4ALPU+2PeukaPnFx78mlwSi00lo6u2JqOhopUJ0XPL4=;
        b=IlVjBHyROh8Bt7QdwbqRl8Ce4IBTg+ygM6qktJMQKsAWcs5jhfmi3xtZR+2vr7J15O
         XKSL9xUK1STw9bkRDxpt7BkmAZZbd4syysXJkct74wCbKLnbuhu9DYeKVqE94Blk2QUu
         aMQdPuY1v9pycU/OkNkanXFcHZWobuWnU//s3991ApH318qmAbG8lZc/tPVpZuCQcIDP
         CH0df/mKfHWL3Dcd72Jdohrz+aExdTzmCmaVd4397XtSVUoPc6wlqJ0dXCq1sALpfEzq
         YJfdOQvk7TIz42udwvzCV6g6xQ6v2wvuFMnj+rMyDrb0MuCqSkimAne8TEGIvbg3N4J8
         DHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733100999; x=1733705799;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ALPU+2PeukaPnFx78mlwSi00lo6u2JqOhopUJ0XPL4=;
        b=wi9Tof7hDFaHB5HM+QeN+9X3EM/AwcopsR4DPAAY1Goz9FinkJbfmZerSiiWfxjjoo
         V+ZJMxwhzE+irlYGTkr4zokcy+bztfJ8ouYqnDG6UoVJ3TsmwOPn+mnIy5V4B3LjD1Ty
         +zo+HbRwNI0zTf7V6IndKAGAuiuaN3FVIPT1XgVR1uSkV9vaG4GbhsZM2nRidkzR64Jz
         nmH2djl8quGwWbZXMIDl3QU/LKLJVSLBBd+b3upg0yFFcRQDDJr1sty1S+hbqgxTN+i8
         X4pRk+TlyuDSqLYExKXr34rcIPmUUqbdOIKmRQfRwP4NJI7lk7YWcV5P8haq9g6aiFMv
         6LkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN+416oOJMPiizyRuVQHGCfwm+/fq3KUmXMmkrC0FYjQz2zk88BQcLDU/x2htOO21PZCzXhzG35rZMyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy42K4yh4bmhL8k453v9TB4YMYbTaSrv+ec9fW2phtiYzVINhPy
	lcOxK72tDrCPVd/u/qZMuXt41SOf2AkW2bW3ykmoCUxGJHgJ8dc3
X-Gm-Gg: ASbGncuAE1LVCkoAlW+rHphM6kLvMVK7h4DYQej3RccD5GMYe3FRGbN/10mMnxnFg7+
	SJZgB8nuLiMbCDhn0+UpajLzu+jV6c0vEBtjn8cQ7VBa+iz/djSeb5QgTYxkjiWZlNA0vQsI5lw
	H+rjbRBqWu5sYaNqY4PlPSRPpqXXWPfEovVJR1tzhBKCOZ8gtjZw157zNcKNodAP6DC81pdZUmg
	FrhyHQ9nWKM0rDaIWClrbwEk1DNC/B/LAgrezf+aYJq+xwlLZITpw==
X-Google-Smtp-Source: AGHT+IFPODb6sC95pHo2MfpfBNDyOzrbYVuKN4JKcprt0OVXgaeDgAjy5GHutHf/PkxQ39bCDFNHNw==
X-Received: by 2002:a05:6000:4612:b0:385:f00a:a45b with SMTP id ffacd0b85a97d-385f00aa53dmr2489609f8f.21.1733100999376;
        Sun, 01 Dec 2024 16:56:39 -0800 (PST)
Received: from [10.2.0.2] ([146.70.83.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0bf67ab0dsm2727840a12.24.2024.12.01.16.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2024 16:56:38 -0800 (PST)
Message-ID: <ab155793-c2a6-4ee4-9c7a-2209c66143d3@gmail.com>
Date: Mon, 2 Dec 2024 00:56:37 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug report] Regression in kernel 6.12.1 preventing asus_nb_wmi
 from loading
To: Armin Wolf <W_Armin@gmx.de>, hdegoede@redhat.com,
 linux-hwmon@vger.kernel.org
References: <0bc76531-d88f-4288-8a3c-023dbe04dfb2@gmail.com>
 <06787c88-5f04-4ffe-bfde-829edcb553f9@gmx.de>
Content-Language: en-GB
From: Edoardo Brogiolo <brogioloedoardo@gmail.com>
In-Reply-To: <06787c88-5f04-4ffe-bfde-829edcb553f9@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Armin,


Please find below the acpidump outputs for

Linux 6.12.1
https://www.brogiolo.eu/nextcloud/s/NFPKR6gPErTAnnn

Linux 6.12.1 with patch b012170fed282151f7ba8988a347670c299f5ab3 reversed
https://www.brogiolo.eu/nextcloud/s/NePsSABrnHTfQNf

I would be happy to test your patch at 
https://bugzilla.kernel.org/show_bug.cgi?id=219517, but lack experience 
compiling the Linux kernel.
How would I be able to fit the diff file in the following step-by-step 
guide? https://wiki.archlinux.org/title/Compile_kernel_module

Thank you,

Edoardo


On 01/12/2024 16:46, Armin Wolf wrote:
> Am 01.12.24 um 11:40 schrieb Edoardo Brogiolo:
>
>> Dear all,
>>
>> I hope this e-mail finds you well.
>> I am writing to bring up an issue I have experienced since upgrading
>> to the Linux kernel 6.12.1:
>>
>> I have been unable to set max battery charging, keyboard brightness,
>> and actioning special keys (micmute, enable touchpad, etc.).
>>
>>
>> With the help of the Archlinux devs
>> (https://bbs.archlinux.org/viewtopic.php?id=301341), the issue was
>> found to have been introduced by
>>
>> kernel patch b012170fed282151f7ba8988a347670c299f5ab3
>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b012170fed282151f7ba8988a347670c299f5ab3), 
>>
>> leading to the kernel being unable to load  asus_nb_wmi.
>>
>>
>> Reverting that patch fixes all of the aforementioned issues. Please
>> see the Archlinux bbs thread for full logs and steps taken to identify
>> said patch as the cause of the regression.
>> While I do not possess the technical skills to help developing and
>> implementing a fix, I would be keen to help out testing possible
>> solutions on my hardware.
>>
> Interesting, can you share the output of "acpidump"? Can you also try 
> the patch proposed in a similar bug report 
> (https://bugzilla.kernel.org/show_bug.cgi?id=219517)?
>
> Thanks,
> Armin Wolf
>
>> Thank you, and kind regards,
>>
>>
>> Edoardo Brogiolo
