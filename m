Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:57860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751107AbdBBPcC (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 2 Feb 2017 10:32:02 -0500
MIME-Version: 1.0
In-Reply-To: <87f4e9636acbcc5facc169d590b110cb@linux.vnet.ibm.com>
References: <1485877437-13598-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1485877437-13598-6-git-send-email-eajames@linux.vnet.ibm.com>
 <20170201173450.ysuk3j2hwoldz72o@rob-hp-laptop> <87f4e9636acbcc5facc169d590b110cb@linux.vnet.ibm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 2 Feb 2017 09:31:38 -0600
Message-ID: <CAL_JsqKV=dtPjpaB3ipVz6PY=nRnOePEStsWKUjvKT+3CxOhTg@mail.gmail.com>
Subject: Re: [PATCH linux v5 5/6] hwmon: occ: Add hwmon implementation for the
 P8 OCC
To: eajames <eajames@linux.vnet.ibm.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Feb 2, 2017 at 9:06 AM, eajames <eajames@linux.vnet.ibm.com> wrote:
> On 2017-02-01 11:34, Rob Herring wrote:
>>
>> On Tue, Jan 31, 2017 at 09:43:56AM -0600, eajames@linux.vnet.ibm.com
>> wrote:
>>>
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>
>>> Add code to tie the hwmon sysfs code and the POWER8 OCC code together, as
>>> well as probe the entire driver from the I2C bus. I2C is the
>>> communication
>>> method between the BMC and the P8 OCC.
>>>
>>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>> ---
>>>  Documentation/devicetree/bindings/hwmon/occ.txt |  13 +++
>>
>>
>> Please add acks when posting new versions.
>
>
> Thanks Rob, should I put up a new version with acked by, and no other
> changes? Also, do you mean to acknowledge this patch only, or all the
> patches? I'm new to this process...

No, only when you send a new version of the series. If you don't send
a new version, the maintainer should add any acks when applying. You
just can't expect them to find all versions and add the acks.

Rob
