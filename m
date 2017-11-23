Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:38993 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752597AbdKWGc1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Nov 2017 01:32:27 -0500
MIME-Version: 1.0
In-Reply-To: <20171118161533.GA2810@roeck-us.net>
References: <1510543655-27059-3-git-send-email-mine260309@gmail.com> <20171118161533.GA2810@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Nov 2017 17:02:05 +1030
Message-ID: <CACPK8Xc5zmHCmDikYFPA+GdVCydHwgiLMY0X1RTyOmzS+m9W7A@mail.gmail.com>
Subject: Re: [v4,2/3] drivers: hwmon: Add W83773G driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Lei YU <mine260309@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Nov 19, 2017 at 2:45 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Mon, Nov 13, 2017 at 11:27:33AM +0800, Lei YU wrote:
>> Nuvoton W83773G is a hardware monitor IC providing one local
>> temperature and two remote temperature sensors.
>>
>> Signed-off-by: Lei YU <mine260309@gmail.com>
>
> Applied to hwmon-next.

Where does hwmon-next live? I was looking on kernel.org and I can't
seem to find it.

Cheers,

Joel
