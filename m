Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F5EC433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Nov 2022 21:07:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234080AbiKKVHp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Nov 2022 16:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233842AbiKKVHo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Nov 2022 16:07:44 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682DE833AC
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Nov 2022 13:07:43 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id v17so5170878plo.1
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Nov 2022 13:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1UbHOqnPNCOilnpyC/Gk6owDbQr/DghKe/AIdJFL7OA=;
        b=dcqjaS5Sm4AFaJ7A8iLje/A4mP/MuV/4c61ZgTQZyLFNnGrZZ/BGiUXI09P1InJiFR
         KW0Xm6rz6GpThAC0xv5uqffYho4bvpSMBTuoqW4KOh+mOUlEix0p7YZhkV11KlQpoy2K
         ifVskTSrHPisCc47y4ok1EkR0YbtEILMfy3CUr4+Vq96T+6aW8FAhac7YsiRUa+QXhSr
         2NqNbVwfSo1HAyTd+JW/g0EGjO4M2C5GBeM5jHLMYMnPNGEFR+1iD82/tlFjKeQrUrs7
         AJrohjKqYCTrhGr4OhyQ5sX+/jGoVvKvgX/9DGz7ua8UbvT3qQhq74wWw4l0Xl0wNmYf
         69jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1UbHOqnPNCOilnpyC/Gk6owDbQr/DghKe/AIdJFL7OA=;
        b=XvekU6InAGL6vcbOeMO+RqT5oRqlOFuj5bGUIUDcLLU+AU5cDsTKr+UAVU8l/J3337
         2aC5gfSOHIQIpd7BYzVu34DrDiQkLK11D+ED9JEr+EC7HuR6YuEcB5Ik/Z7mHQSqoQoa
         o82FheTMCsq+x1Xb6S5aQUcOpo7M9uFDv/RCtrenNwhnZj8ajdjX/+nMNwCcCkxL9DFr
         aIeNIwRZu7YZvO50KCHK1bfQFVI27QUExwC/75/tQ7xTXrS5rW+fGXUnP07Rtf6bQLj+
         PmF60Z2Iy3mCuItsB7jUCMtHQbflhuU9RzVfV6hAHJ18plyRfroGxC4nlkautvxk8Iqg
         /eWw==
X-Gm-Message-State: ANoB5pk3e7jR4Q67sFVB6XBRY2N+6/2zOM8S2F3mWyPYNfPSl3H3R1rK
        17HYqF2opFOldVdawQhD5NOYvg==
X-Google-Smtp-Source: AA0mqf6A3RRROpoZCJbd2mFTNzmTgQE6WZbH93Czcwbm8bITJSEMnmyIrjCwAdplvykKwvdBjqBreQ==
X-Received: by 2002:a17:90b:4fce:b0:203:6932:1d5f with SMTP id qa14-20020a17090b4fce00b0020369321d5fmr3813947pjb.112.1668200862943;
        Fri, 11 Nov 2022 13:07:42 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:da6a:d4a2:1253:adfc:370? ([2405:201:d02f:da6a:d4a2:1253:adfc:370])
        by smtp.gmail.com with ESMTPSA id w125-20020a623083000000b00571bdf45885sm980169pfw.196.2022.11.11.13.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 13:07:42 -0800 (PST)
Message-ID: <cc62e433-83c4-f285-edc2-a2d808163074@9elements.com>
Date:   Sat, 12 Nov 2022 02:37:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>
References: <20221013094838.1529153-1-Naresh.Solanki@9elements.com>
 <20221013094838.1529153-2-Naresh.Solanki@9elements.com>
 <20221024161806.GA1855651-robh@kernel.org>
 <dcd22f70-e51c-290e-c11f-9a5ce32748c1@9elements.com>
 <CAL_JsqKT52ULEZjKo9emEAt74nH2OpMO8ymLLKM_T-NzAwqGog@mail.gmail.com>
 <3152c290-8aca-b91a-df20-335c33395835@9elements.com>
 <20221101184402.GA1884153-robh@kernel.org>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <20221101184402.GA1884153-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rob,

On 02-11-2022 12:14 am, Rob Herring wrote:
> On Mon, Oct 31, 2022 at 01:35:09PM +0530, Naresh Solanki wrote:
>> Hi Rob,
>>
>> On 26-10-2022 07:07 pm, Rob Herring wrote:
>>> fanc: fan-controller {
>>>     #pwm-cells = <3>;
>>>     ...
>>>
>>>     fan {
>>>       pwms = <&fanc 0 500000  PWM_POLARITY_INVERTED>;
>>>       ...
>>>     };
>>> };
>>>
>>> 0 is PWM number and 500000 is the PWM frequency. The 3rd cell are per
>>> consumer flags. See pwm.txt for more details.
>>
>> Did the implementation & while testing getting the below err:
>> [63.626505] max6639 166-002e: failed to create device link to 166-002e
> 
> Does turning off fw_devlink help (fw_devlink=off)?

Will supplier == consumer, device link creation fails.
Not sure what is best approach but not creating device link in this 
scenario help & for that below additional changes needed in pwm core.

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 4527f09a5c50..afea51c49138 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -730,6 +730,12 @@ static struct device_link 
*pwm_device_link_add(struct device *dev,
  		return NULL;
  	}

+	/*
+	 * Do not attempt to create link if consumer itself is supplier.
+	 */
+	if (dev == pwm->chip->dev)
+		return 0;
+
  	dl = device_link_add(dev, pwm->chip->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
  	if (!dl) {
  		dev_err(dev, "failed to create device link to %s\n",



Regards,
Naresh
