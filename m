Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58723 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758973AbcGKOsi (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 11 Jul 2016 10:48:38 -0400
Subject: Re: [PATCH 1/3] dt/bindings: Add bindings for JC-42.4 compatible
 temperature sensors
To: Rob Herring <robh@kernel.org>
References: <1467737073-7949-1-git-send-email-linux@roeck-us.net>
 <20160711143025.GA6312@rob-hp-laptop>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Joachim Eastwood <manabian@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5783B1AE.90400@roeck-us.net>
Date: Mon, 11 Jul 2016 07:48:14 -0700
MIME-Version: 1.0
In-Reply-To: <20160711143025.GA6312@rob-hp-laptop>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/11/2016 07:30 AM, Rob Herring wrote:
> On Tue, Jul 05, 2016 at 09:44:31AM -0700, Guenter Roeck wrote:
>> Provide generic bindings for all Jedec JC-42.4 compatible temperature
>> sensor chips.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   Documentation/devicetree/bindings/hwmon/jc42.txt | 42 ++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/jc42.txt
>
> Acked-by: Rob Herring <robh@kernel.org>
> --

Thanks!

Guenter


