Return-Path: <SRS0=ZG3s=PP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CCDC43387
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Jan 2019 06:35:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2B5020859
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Jan 2019 06:35:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDq0T9cN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfAGGfp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Jan 2019 01:35:45 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37964 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbfAGGfp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Jan 2019 01:35:45 -0500
Received: by mail-pg1-f194.google.com with SMTP id g189so20298376pgc.5;
        Sun, 06 Jan 2019 22:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+4IsfouBM5k447fQjg2cNq9AAdG3mq/zeEqYKpDOerY=;
        b=jDq0T9cNzS+qQylrCqprqiv43L6B8a3jBETEBaNmVDZiEkF2wUqA11X7+WRD37oEXT
         v18vmI/y80FxXOcKv3C2xV6ETAGS+zmpscBm0P6rbKGQC16OYmCBVAsJ4n6mz0vzZDzq
         6EYdWClTh1VU3bJL2ml+ReyDWVG2myjIMJ6mh6+ljEJiUhlScSqZ6qY9mKrLOhGD2mot
         EQuY2g2agrQHJu04XT/8RTDQs6IxeoAgCCH49uBTLNZAp7XsvwlVb8wF+VGABLR696Wg
         ihGLnbXoMLaj4sjg8sN9S4FPG64iXlh8WffdnueTYDhjSRCuZVZOfpRHPs8az66RRY31
         dX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+4IsfouBM5k447fQjg2cNq9AAdG3mq/zeEqYKpDOerY=;
        b=mjHrSyNBSZC0UnGsCqf8ZpNr3iCopKpLVsueIEqsPP2NH2rNPColbYUHyk+YESk7pQ
         1irQeZPe/8FEgOZ7yGReJpgyFO0LLiwfUEHtgR8hq6+P8fB712GHBdPOZKQmeu6FNUHX
         BiX3hPT3yWSx9goZNG0uQw5JcHIFjKPSqV7MQetY3PIlPNeN5LHd0ABvTPzqkCHBpqUo
         zoOR0IvkvuH9zY7nCzpdqmjREt63KxfJWb4R8d0uOz9qFaIgT9rN2chdnf7nrSHl9KPQ
         2gPKPPc+xebXeRsN2M3GKes/tvCUb27uGkycwagPHAESFTWn+h05SWFNkKz7+ktX4iZ6
         HylQ==
X-Gm-Message-State: AJcUukfgkZ6kcs23shF82481brxebN2rFAeJQ5zQIDhs3FRLQtcKvu3x
        +cBAJpdW7AiR+uCPbpMpcaLtnaXL
X-Google-Smtp-Source: ALg8bN5Xq94IKikOFLPj3bv+ASpH6ywwcwP9rPcJaWv5jkc2dy0VXfBVOxceM9Wr8RsxheAwzdv5Cw==
X-Received: by 2002:a63:8441:: with SMTP id k62mr28909415pgd.392.1546842944148;
        Sun, 06 Jan 2019 22:35:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v89sm98503674pfk.12.2019.01.06.22.35.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Jan 2019 22:35:43 -0800 (PST)
Subject: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
To:     "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
Cc:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Yang, Shunyong" <shunyong.yang@hxt-semitech.com>,
        "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <20190105170518.GA1879@roeck-us.net>
 <d3a77a2f9b1741a28f5a2b394b517ea2@HXTBJIDCEMVIW02.hxtcorp.net>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <fa369fc7-23ad-8f06-e295-c591746cfa58@roeck-us.net>
Date:   Sun, 6 Jan 2019 22:35:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <d3a77a2f9b1741a28f5a2b394b517ea2@HXTBJIDCEMVIW02.hxtcorp.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/6/19 10:30 PM, Liu, Xiaoting wrote:
> Hi Guenter Roeck,
> 
> Thanks for your reply.
> 
> On 2019/1/6 1:05, Guenter Roeck wrote:
>> On Fri, Jan 04, 2019 at 05:00:30PM +0800, Xiaoting Liu wrote:
>>> Bindings for DPS650AB power, voltage, temperature, and fan monitering.
>>>
>> Misleading subject. While the DPS650AB may ber a power supply,
>> it is a PMBus hwmon driver, and should be marked accordingly in the subject.
>>
>> Guenter
> 
> We will change the subject as "dt-bindings: hwmon: Add dps650ab
> documentation", is that okey?
> 

Sure.

Thanks,
Guenter

> Thanks,
> 
> Xiaoting.
> 
>>> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
>>> ---
>>>   Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> --
>>> 1.8.3.1
>>>
>>>
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>>> new file mode 100644
>>> index 000000000000..bbd601100e66
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>>> @@ -0,0 +1,11 @@
>>> +Bindings for DPS650AB power, voltage, temperature, and fan monitering
>>> +
>>> +Required properties:
>>> +- compatible : "dps650ab"
>>> +- reg        : I2C address, one of 0x58, 0x59.
>>> +
>>> +Example:
>>> +       dps650ab@58 {
>>> +                   compatible = "dps650ab";
>>> +                   reg = <0x58>;
>>> +       };
> 
> 
> 
> 
> 
> This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
> 
> 
> 

