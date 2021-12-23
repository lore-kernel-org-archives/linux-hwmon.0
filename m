Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EA2C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Dec 2021 10:12:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347634AbhLWKM3 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Dec 2021 05:12:29 -0500
Received: from aposti.net ([89.234.176.197]:37094 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242964AbhLWKM3 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Dec 2021 05:12:29 -0500
Date:   Thu, 23 Dec 2021 10:12:21 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Introduce common properties
To:     Rob Herring <robh@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <LCCK4R.28LR6ABJ7YZG3@crapouillou.net>
In-Reply-To: <VW9K4R.K71G6V70Q9T81@crapouillou.net>
References: <20211221175029.144906-1-paul@crapouillou.net>
        <20211221175029.144906-2-paul@crapouillou.net>
        <YcN+NwFu2m6WZCdE@robh.at.kernel.org> <VW9K4R.K71G6V70Q9T81@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



Le jeu., déc. 23 2021 at 09:19:43 +0000, Paul Cercueil 
<paul@crapouillou.net> a écrit :
> Hi Rob,
> 
> Le mer., déc. 22 2021 at 15:36:23 -0400, Rob Herring 
> <robh@kernel.org> a écrit :
>> On Tue, Dec 21, 2021 at 05:50:28PM +0000, Paul Cercueil wrote:
>>>  Introduce a file for common properties of hwmon sensors.
>>> 
>>>  As of now it contains only the "label" property, which can contain 
>>> a
>>>  descriptive label that allows to uniquely identify a device within 
>>> the
>>>  system.
>> 
>> I don't think we need this. What we need is a global (in dtschema)
>> type definition and then any users just add 'label: true'.
> 
> Well, users would also need to set an actual label, otherwise this 
> defeats the point :)

Disregard that, I'm stupid. 'label: true' is for the schema and not the 
DTS files.

-Paul


