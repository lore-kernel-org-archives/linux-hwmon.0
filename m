Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D32C04E69
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Aug 2023 20:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbjHHUYh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Aug 2023 16:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjHHUYZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Aug 2023 16:24:25 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4558A1E580;
        Tue,  8 Aug 2023 12:35:34 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-348de515667so24883875ab.1;
        Tue, 08 Aug 2023 12:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691523333; x=1692128133;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lr2Tw1pBIEBd4A2jz9qfgPa+zTpz46GsU3Cc2P9Qiw=;
        b=TfFmb4+w8wUjJVAaoG6NdNMXu6LRtIh2fyDTb/NVf+3ndz0iVWo91M9+f+XLvU7N5c
         xBpk726RKEnfPbb7BNs7MWM+M0mo5zkUjEyEzXbIqjY1ikMEi5bGq9sfXXNBB4AynQyw
         fBGbGf/iPoFjue3sl+vQOuU/UJlkjsE0v+eaO6IaPFkqRV3/H9hryWyHzJwfV+3cUHnP
         LtHRshfoFzgWU285pXfrdUGHUQ7nCsWWtNe+eDSkLXQJ+yDvYO6XXfrNzQS1if9bzGbn
         yvDqadupeKrz/3ty8BgWInOsKecuegv5plvUS8zuL8ngWosliNSXNDCmIDP/l2ICBq8j
         SqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691523333; x=1692128133;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7lr2Tw1pBIEBd4A2jz9qfgPa+zTpz46GsU3Cc2P9Qiw=;
        b=JmP5sbk4egVKD05Jk3odIYETOpzzkmeZy3aYVUDaLTO86+QTm4b3wS+oHRp0Tpe35q
         RsTcbr0/8pIrWgSWdeA6fFU6WIdDV6HJaNFXHheCnriEwLSS5eYS/LYeP7ZG0DGm39L2
         27/m4X3l/mTaLq9IkJHeE+yYyzP4bP7F4n5SA9xnf/+O6efZp5uStq7p4wJCPujmWl02
         sOJ/47lMSB6ABlg61nEbLQtBOjvKWARscqqw/CUvKU8xTqqfle4YasVOaWF6/Hx60esQ
         IEf+P0UnBdh8Jn2eAC/XotjkTK/o6nlmEm1iw5F2Fe+ewUp9X+J0ihpuvGYB9UmffxjN
         dAHg==
X-Gm-Message-State: AOJu0YzxhNuOC7x7xyxHotJc+2UcQwSalvPCh0FlmUKnO5lTvUcfGfR/
        vqCrafpoPoSO6y7LRpc86XI=
X-Google-Smtp-Source: AGHT+IEC8uP96mIEHvvBS2fpsKgrxek20+6aNRA2xV1GDmBsvLonjo08tHrkkJDdsdONMrS+JyRRuw==
X-Received: by 2002:a05:6e02:1c28:b0:348:ec07:9dfa with SMTP id m8-20020a056e021c2800b00348ec079dfamr764409ilh.14.1691523333274;
        Tue, 08 Aug 2023 12:35:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ep19-20020a0566384e1300b0042bb1779c18sm3294123jab.151.2023.08.08.12.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 12:35:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c46e24e0-b054-e59f-34bc-e5ddcb93b6d8@roeck-us.net>
Date:   Tue, 8 Aug 2023 12:35:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Huibin Shi <henrys@silicom-usa.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Henry Shi <henryshi2018@gmail.com>,
        "hbshi69@hotmail.com" <hbshi69@hotmail.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "bp@alien8.de" <bp@alien8.de>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc:     "hb_shi2003@yahoo.com" <hb_shi2003@yahoo.com>,
        Wen Wang <wenw@silicom-usa.com>
References: <20230718160104.2716-1-henryshi2018@gmail.com>
 <fb62b2e7-7c7c-dc2e-768d-3393f151eb32@wanadoo.fr>
 <PA4PR04MB92225B65A45868A9CBE25B999A06A@PA4PR04MB9222.eurprd04.prod.outlook.com>
 <8686c5c3-81b0-278f-d81b-0c906bac62a8@roeck-us.net>
 <PA4PR04MB922285C2DC1BB0BDBDD602B39A0DA@PA4PR04MB9222.eurprd04.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] Add Silicom Platform Driver
In-Reply-To: <PA4PR04MB922285C2DC1BB0BDBDD602B39A0DA@PA4PR04MB9222.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/8/23 12:19, Huibin Shi wrote:
> Guenter,
> 
> Here is the implementation of  devm_kmemdup(), *src is the extra argument
> 
> void *devm_kmemdup(struct device *dev, const void *src, size_t len, gfp_t gfp)
> {
> 	void *p;
> 
> 	p = devm_kmalloc(dev, len, gfp);
> 	if (p)
> 		memcpy(p, src, len);
> 
> 	return p;
> }
> 

So you don't want to use devm_kmemdup() because of its 'src' argument, and instead
re-implement it locally by using devm_kzalloc() followed by memcpy() ? Really ?

Guenter

