        !This dice_roll program will randomly print a number from 1 to 6.
        !The date_and_time function was used.
        !Modules were implemented.
        !Main program starts from line 173.
        
        !----------------Module 1-------------------------------
        !Change month from number to string
        module mod_month2str
        
        implicit none
        
        contains
        
            subroutine month2str_1
            
                character::date,time,zone
                character(len=3)::str
                integer,dimension(8)::values
                integer::month
                
                call date_and_time(date,time,zone,values)
                
                !print*,"The month is>>",values(2)
                month=values(2)
                !print*,"The month is>>",month
                
                if(month==1) then
                    write(str,*)month
                    str="Jan"
            
                else if(month==2) then
                    write(str,*)month
                    str="Feb"
        
                else if(month==3) then
                    write(str,*)month
                    str="Mar"
            
                else if(month==4) then
                    write(str,*)month
                    str="Apr"
        
                else if(month==5) then
                    write(str,*)month
                    str="May"
            
                else if(month==6) then
                    write(str,*)month
                    str="Jun"
            
                else if(month==7) then
                    write(str,*)month
                    str="Jul"
                    
                else if(month==8) then
                    write(str,*)month
                    str="Aug"

                else if(month==9) then
                    write(str,*)month
                    str="Sep"
            
                else if(month==10) then
                    write(str,*)month
                    str="Oct"
        
                else if(month==11) then
                    write(str,*)month
                    str="Nov"
        
                else if(month==12) then
                    write(str,*)month
                    str="Dec"
                
                endif
        
                print*,"Today is ",str, values(3)
        
            end subroutine month2str_1
        
        end module mod_month2str
        
        !----------------Module 2-------------------------------
        !Change the format of the time
        module mod_time
        
        implicit none
        
        contains
        
            subroutine time_format
            
                character::date,time,zone
                character(len=2)::hour_format
                integer,dimension(8)::values
                integer::hour,minute,second,new_hour
                
                call date_and_time(date,time,zone,values)
                
                hour=values(5)
                
                if(hour>12) then
                    new_hour=hour-12
                    hour_format="PM"
                    
                else
                    new_hour=hour
                    hour_format="AM"
                
                end if
                
                print*,"Current time is ",new_hour,":",values(6),hour_format
            
            end subroutine time_format
            
        end module mod_time
        
        !----------------Module 3-------------------------------
        !Prints the dots
        module mod_printdot
        
        implicit none
                
                real::a
                
        contains
        
            subroutine dice_face
            
                if(int(a)==1) then
				
			print*," ----- "
			print*,"|     |"
			print*,"|  .  |"
			print*,"|     |"
			print*," ----- "
            
                else if(int(a)==2) then
				
			print*," ----- "
			print*,"| .   |"
			print*,"|     |"
			print*,"|   . |"
			print*," ----- "
          
                else if(int(a)==3) then
				
			print*," ----- "
			print*,"| .   |"
			print*,"|  .  |"
			print*,"|   . |"
			print*," ----- "
            
                else if(int(a)==4) then
				
			print*," ----- "
			print*,"| . . |"
			print*,"|     |"
			print*,"| . . |"
			print*," ----- "
            
                else if(int(a)==5) then
				
			print*," ----- "
			print*,"| . . |"
			print*,"|  .  |"
			print*,"| . . |"
			print*," ----- "
            
                else
				
			print*," ----- "
			print*,"| . . |"
			print*,"| . . |"
			print*,"| . . |"
			print*," ----- "
            
                endif
            
            end subroutine dice_face
        
        end module mod_printdot
        
        
        !--------------This is the main program----------------------
        
        program dice_roll
        
        use mod_month2str
        use mod_time
        use mod_printdot
        
        implicit none
        
        real::r
        integer::month
        character::start,cont
        character(len=3)::str
        
        print*,"**************************"
        print*,"Welcome to dice roll."
        call month2str_1
        call time_format
        print*,"**************************"
        print*,"Press Y to start the dice roll."
        
        read*,start
        
        if(start=="y") then
        
            10 continue
            
            call random_seed()
            call random_number(r)
            
            !random_number return real values between 0 to 1.
            !To get 6 integers, multiply "r" with 6 and +1.
            a=r*6.0+1.0
        
            print*,"The dice rolled is: ",int(a)
            call dice_face
            
            print*,"Do you want to continue?Y/N"
            read*,cont
            
                if(cont=="y") then
                    go to 10
                    
                endif
                
                go to 20
        end if
        
        20 print*,"Thank you for playing!"

        end program dice_roll
