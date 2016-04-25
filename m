Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-bl2on0093.outbound.protection.outlook.com ([65.55.169.93]:59328
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752601AbcDYO7D (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 25 Apr 2016 10:59:03 -0400
Reply-To: <tthayer@opensource.altera.com>
Subject: Re: [PATCH 08/11] dt-bindings: mfd: Add Altera A10-SR power supply
 alarm
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
 <1461339219-15255-9-git-send-email-tthayer@opensource.altera.com>
 <20160425125713.GA6578@rob-hp-laptop>
To: Rob Herring <robh@kernel.org>
CC: <lee.jones@linaro.org>, <linus.walleij@linaro.org>,
	<gnurou@gmail.com>, <jdelvare@suse.com>, <linux@roeck-us.net>,
	<pawel.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <dinguyen@opensource.altera.com>,
	<linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>
From: Thor Thayer <tthayer@opensource.altera.com>
Message-ID: <571E31E9.1000309@opensource.altera.com>
Date: Mon, 25 Apr 2016 10:04:09 -0500
MIME-Version: 1.0
In-Reply-To: <20160425125713.GA6578@rob-hp-laptop>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org



On 04/25/2016 07:57 AM, Rob Herring wrote:
> On Fri, Apr 22, 2016 at 10:33:36AM -0500, tthayer@opensource.altera.com wrote:
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> Add power supply alarm from the hwmon framework.
>
> hwmon framework is a Linuxism that has nothing to do with the h/w
> description.
>
OK. I was careful to remove it in the binding and will remove it from 
the description as well.

>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>> ---
>>   .../devicetree/bindings/mfd/altera-a10sr.txt       |    8 ++++++++
>>   1 file changed, 8 insertions(+)
>
> Just squash this into the 1st patch.
>
> Rob
>
OK. Thank you for reviewing.
