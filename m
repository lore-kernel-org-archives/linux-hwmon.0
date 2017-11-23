Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:41583 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751643AbdKWJBN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Nov 2017 04:01:13 -0500
Subject: Re: [v4,2/3] drivers: hwmon: Add W83773G driver
To: Joel Stanley <joel@jms.id.au>
Cc: Lei YU <mine260309@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>
References: <1510543655-27059-3-git-send-email-mine260309@gmail.com>
 <20171118161533.GA2810@roeck-us.net>
 <CACPK8Xc5zmHCmDikYFPA+GdVCydHwgiLMY0X1RTyOmzS+m9W7A@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <3f12394e-d086-43b6-9cff-da2e93aaa02d@roeck-us.net>
Date: Thu, 23 Nov 2017 01:01:10 -0800
MIME-Version: 1.0
In-Reply-To: <CACPK8Xc5zmHCmDikYFPA+GdVCydHwgiLMY0X1RTyOmzS+m9W7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/22/2017 10:32 PM, Joel Stanley wrote:
> On Sun, Nov 19, 2017 at 2:45 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On Mon, Nov 13, 2017 at 11:27:33AM +0800, Lei YU wrote:
>>> Nuvoton W83773G is a hardware monitor IC providing one local
>>> temperature and two remote temperature sensors.
>>>
>>> Signed-off-by: Lei YU <mine260309@gmail.com>
>>
>> Applied to hwmon-next.
> 
> Where does hwmon-next live? I was looking on kernel.org and I can't
> seem to find it.
> 
git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
branch hwmon-next, but I('ll only push it after the commit window closes.

Guenter
