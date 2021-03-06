#lang curr/lib

@title{Unit 3: Manipulating Tables }

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{num-sqrt, num-sqr} 
                                              @code{4, -1.2. 2/3})
                                       (list "String" 
                                              @code{string-repeat, string-contains} 
                                              (list @code{"hello" "91"} ))
                                       (list "Boolean" 
                                              @code{} 
                                              (list @code{true false} ))
                                       (list "Image" 
                                              @code{triangle, circle, star, rectangle, ellipse, square, text, overlay} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       )]{
  @unit-descr{
    Students extend their knowledge of functions to include methods, and learn about Table methods for sorting, filtering and extending Tables. They are also introduced to Table Plans (a structured approach to manipulating tables), and begin manipulating their own datasets.
  }
}
@unit-lessons{

  @lesson/studteach[
     #:title "Review"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
              @point{
                    @student{
                          In the last lesson, you learned how to define functions of your own using the Design Recipe. You defined a number of functions that work on Rows of the @code{animals-table}. 
                          @activity[#:forevidence (list )]{
                                What are the steps of the Design Recipe?
                          }
              }
                    @teacher{

                    }
            }
            @point{
                    @student{
                          Open @editor-link[#:public-id "0BzzMl1BJlJDkbnZhbE1QSEE0eEE" "Animals Dataset (w/Functions)"] in a new tab, select "Save As" from the file menu, and click "Run". As you scroll through the file, you'll notice functions defined at the top. Some of these functions are similar to the ones you defined earlier, and others are totally new!
                          @activity[#:forevidence (list )]{
                                Open your student workbook to @worksheet-link[#:name "Reviewing-Functions"], and use the code in the Definitions Area to answer the questions there.
                          }
                    }
                    @teacher{
                          Note: one of the examples is failing -- this is @italic{intentional!}
                    }
            }
            @point{
                    @student{
                          The animal shelter might use this dataset in many ways. For example, it might want to see a list of animals ordered from oldest-to-youngest, or a list of names in alphabetical order. The shelter might also want to compute @italic{new columns} for their dataset. For example, they might want a new, numeric column that shows the animals' age in weeks instead of years, or make a new Boolean column showing which animals are dogs over the age of 2.
                          @activity[#:forevidence (list )]{
                              Complete to @worksheet-link[#:name "Animals-Plans"] in your Student Workbook.
                          }
                    }
                    @teacher{

                    }
            }

        ]
  }

  @lesson/studteach[
     #:title "Introducing Methods"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
            @point{
                  @student{
                        You've been calling functions like @code{triangle}, @code{num-sqr} or @code{num-min} for a while now, and the rules are pretty straightforward: at any point, you can just write the name of the function, then pass in one or more arguments inside parentheses. @code{num-sqr(4)} will always evaluate to @code{16}, because the function always works the same way and 4 squared is always 16.

                  }
                  @teacher{

                  }
            }
            @point{
                  @student{
                        Pyret also has another kind of procedure, which behaves a little differently. These procedures are called @italic{table methods}. Let's take a look at one table method, and compare it to a function you already know. 
                        @activity[#:forevidence (list )]{
                          Type both of these into the Interactions Area and see what comes out.
                          @code[#:multi-line #t]{
                              get-row(animals-table, 2)
                              animals-table.row-n(2)
                          }
                          Both of these expressions do the same thing, but they are written quite differently. How many differences can you find?
                        }
                  }
                  @teacher{
                        Have students volunteer @italic{as many as they can}. 
                  }
            }
            @point{
                  @student{
                        Table methods are different from @vocab{functions} in three important ways:

                          @itemlist[
                                  @item{
                                        @italic{They are called differently}. A method has to be called as part of a Table, and cannot be used on its own. You can write @code{get-row} wherever you like, but @code{.row-n} only works when attached to the name of a Table, separated by a dot.
                                  }
                                  @item{
                                        @italic{Their contracts are different.} The @code{.row-n} method only exists within the @code{Table} Type, so we can't use its name without also specifying the name of a Table. The contract for a method includes the Type along with the name:
                                         @code[#:multi-line #t]{
                                          <Table>.row-n :: (index :: Number) -> Row
                                         }
                                  }
                                  @item{
                                        @italic{They have a "secret" argument.} The following code uses methods and functions to extract the first row of a table. The function takes in two arguments, but the method appears to only take in one. Can you see the secret argument?
                                        @code[#:multi-line #t]{
                                            get-row(t, 0)  # takes in two arguments!
                                            t.row-n(0)     # takes in....one???
                                        }
                                  }
                          ]


                  }
                  @teacher{
                          This method v. function distinction is subtle, and it's worth spending some time walking through it carefully.
                  }
            }
            @point{
                    @student{
                        How well do you understand methods? Complete @worksheet-link[#:name "Methods"] in your Student Workbook.
                    }
                    @teacher{
                        Have students discuss their answers to Question 7 - for the expressions that @italic{don't} work, can they explain why?
                    }
            }
      ]
  }

  @lesson/studteach[
     #:title "Ordering Rows"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{
                        @student{
                                Pyret lets you change the order of a table's rows with the @code{order-by} method. Let's take a look at the contract for this method, and an example of that orders the @code{animals-table} by species:
                                @code[#:multi-line #t]{
                                    # <Table>.order-by :: (col :: String, ascending :: Boolean) -> Table
                                    animals-table.order-by("species", true)
                                }
                                You can find the contract for this method written at the back of your Student Workbook, along with all the other contracts.
                                @activity[#:forevidence (list )]{
                                    Type the @code{animals-table.order-by} example into the Interactions Area.
                                    What did you get? What will happen if you change @code{true} to @code{false}? How could you sort the table alphabetically by pet name? In order of oldest-to-youngest?
                                }
                        }
                        @teacher{
                              Pyret has a way to sort by multiple columns as well, but that requires one additional concept that students haven't seen yet. Documentation can be @(hyperlink "https://www.pyret.org/docs/horizon/tables.html#%28part._tables_.Table_order-by-columns%29" "found here").
                        }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                  In the Interactions Area, use the @code{.order-by} method to produce a table with all the animals sorted alphabetically by name.
                              }
                      }
                      @teacher{

                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Filtering Rows"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "Data 3.1.1")
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{
                      @student{
                              Sometimes we want to create a @italic{subset} of our data. For example, we might want to filter the rows so that we get a table of only the lizards at the shelter! When we want to filter a Table, we can use the @code{.filter} method. The contract for this method is shown below, along with an example expression that filters the @code{animals-table} to show only those who are fixed.
                              @code[#:multi-line #t]{
                                    # <Table>.filter :: (test :: (Row -> Boolean)) -> Table
                                    animals-table.filter(is-fixed)
                              } 
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Notice that the Domain for the filter method takes in a single value (@code{test}), but that @code{test} is @italic{also a function!} Pyret lets us pass functions into other functions, just as easily as we pass Numbers, Strings, Booleans or Images.
                              @activity[#:forevidence (list )]{
                                  @itemlist[
                                      @item{ According to the contract for @code{.filter}, what datatype does the @code{test} function consume? }
                                      @item{ What datatype does the @code{test} function produce? }
                                  ]
                              }
                      }
                      @teacher{
                              Proceed with caution here: do a lot of checking for understanding!
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence (list "BS-IDE&1&1" "Data 3.1.1&1&1" "Data 3.1.1&1&2" "Data 3.1.1&1&4")]{
                                  In the Interactions Area, use the @code{.filter} method to produce a table of all the kittens.
                              }
                      }
                      @teacher{

                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Building Columns"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{
                      @student{
                              Sometimes we want to @italic{add a column} to a Table, and we can use the @code{.build-column} method to do just that. The contract for this method is shown below, along with an example expression that adds a birth-year to the @code{animals-table}.
                              @code[#:multi-line #t]{
                                    # <Table>.build-column :: (col :: String, builder :: (Row -> Value)) -> Table
                                    animals-table.build-column("year", birth-year)
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence (list "BS-IDE&1&1" "Data 3.1.1&1&3" "Data 3.1.1&1&4")]{
                                  In the Interactions Area, use the @code{.build-column} method to produce a table that includes a @code{nametag} column, which contains an image of the nametag for each pet.
                              }
                      }
                      @teacher{
                              
                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Table Plans"
     #:duration "30 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-DR.1" "BS-DR.2" "BS-DR.4" "Data 3.1.1")
     #:materials @itemlist[]
     #:preparation @itemlist[@item{}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
              @point{
                    @student{
                        Table methods can be chained together, so that we can build, filter @italic{and} order a Table. For example:
                        @code[#:multi-line #t]{
                            # get a table with the nametags of all the fixed animals, ordered by species
                            animals-table.build-column("year", birth-year).filter(is-fixed).order-by("species", true)
                        }
                        This code takes the @code{animals-table}, and builds a new column. According to our Contracts Page, @code{.build-column} produces a new Table, and that's the Table whose @code{.filter} method we use. That method produces @italic{yet another Table}, and we call that Table's @code{order-by} method. The Table that comes back from that is our final result.
                    }
                    @teacher{
                        Suggestion: use different color markers to draw nested boxes around each part of the expression, showing where each Table came from.
                    }
              }
              @point{
                    @student{
                        It can be difficult to read code that has lots of method calls chained together, so we can break them up before each "@code{.}"" to make it more readable. Here's the exact same code, written with line breaks:
                        @code[#:multi-line #t]{
                            # get a table with the nametags of all the fixed animals, order by species
                            animals-table
                              .build-column("year", birth-year)
                              .filter(is-fixed)
                              .order-by("species", true)
                        }
                    }
                    @teacher{
                    
                    }
              }
              @point{
                    @student{
                        These table methods are powerful, and there's an order-of-operations to how they are used. For example, we might want to build a column and then use it to filter or order the table. Therefore, @code{.build-column} always has to come first! To help keep things organized, we can use @bold{Table Plans}. Turn to page @worksheet-link[#:name "Kitten-Tags"]
                    }
                    @teacher{
                        Table Plans are like the Design Recipe, but for manipulating tables. They enforce a @italic{way of thinking}, which is important for your students.
                    }
              }
              @point{
                    @student{
                        Table Plans are a lot like the Design Recipe. They start with a Contract and Purpose Statement, but involve different kinds of examples and can often involve @italic{multiple} function definitions. Let's do an example, which ties together all the pieces you've seen before. Suppose it's time to vaccinate all kittens, and the shelter wants a table that includes nametags for all the kittens in alphabetical order. How do we get started?
                    }
                    @teacher{
                        Your students should be @italic{very} comfortable with the Design Recipe before proceeding!
                    }
              }
              @point{
                    @student{
                        @bannerline{Step 1: Contract and Purpose}
                        We're going to build a function that does this for us, and we'll start with the name. Naming is more complex in Table Plans, since we want to name the function according to the most important parts of what it does. Since we're @italic{getting a table} of kittens with nametags, we'll call it @code{get-kittens-tags}. Instead of consuming Rows, this time we're consuming and producing @italic{Tables}. This gives us the following:

                        @code[#:multi-line #t]{
                            get-kittens-tags :: (animals :: Table) -> Table
                            # get all the kittens, add nametags, and sort by name
                        }
                    }
                    @teacher{
                        Ask students to volunteer other names - but push them to keep the @code{get-} part of the name!
                    }
              }
              @point{
                    @student{
                        @bannerline{Step 2: Examples}
                        This is really similar to writing examples with the Design Recipe, but everything stays on paper. First, we write down a small sample of the @code{animals-table}, called a Sample Table. Then we write a sample result, which we'd get from calling @code{get-kittens-tags} on that Sample Table. For now, we've provided the Starter and Results for you.
                        @itemlist[
                            @item{ Does the Result have our new column? }
                            @item{ Does the Result have only kittens? }
                            @item{ Is the Result in alphabetical order? }
                        ]
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        @bannerline{Step 3: Define the Function}
                        The final step is to define a function that executes our Table Plan. We already know how to start:
                        @code[#:multi-line #t]{
                            get-kittens-tags :: (animals :: Table) -> Table
                            # get all the kittens, add nametags, and sort by name
                            fun get-kittens-tags(animals):
                                ...
                            end
                        }
                    }
                    @teacher{
                        Assessment opportunity: students should be able to write this code this based on what they know about the Design Recipe.
                    }
              }
              @point{
                    @student{
                        Table plans include two parts: defining our new table, and producing our result. To define this table, we'll ask ourselves four questions, in order:
                        @itemlist[
                            @item{ 
                              Does our Result have more columns than our Sample Table? If so, we'll need to use @code{.build-column}. 
                            }
                            @item{ 
                              Does our Result have fewer rows than our Sample Table? If so, we'll need to use @code{.filter}. 
                            }
                            @item{ 
                              Does our Result have its rows in some order? If so, we'll need to use @code{.order-by}.
                            }
                        ]
                        @activity[#:forevidence (list "Data 3.1.1&1&2" "Data 3.1.1&1&4")]{
                            If the answer to any of these questions is "no", @italic{cross out that line in the template}.
                        }
                    }
                    @teacher{
                        All three are needed.
                    }
              }
              @point{
                    @student{
                        All three methods are needed, so we won't cross anything out. You're already familiar with definitions in Pyret, and that's what we'll use here. Let's start with the name @code{t} for Table.
                        @code[#:multi-line #t]{
                            get-kittens-tags :: (animals :: Table) -> Table
                            # get all the kittens, add nametags, and sort by name
                            fun get-kittens-tags(animals):
                                t = animals
                                  .build-column(...)
                                  .filter(...)
                                  .order-by(...)
                            end
                        }
                    }
                    @teacher{
                        It may be helpful to start with all of these methods on one line, and have students see you break them up. Students should be reminded that both forms are valid, but encouraged to use the latter.
                    }
              }
              @point{
                    @student{
                        Now we can fill in those @code{...} sections! 
                        @itemlist[
                          @item{ 
                              For each Row, we know we need to build a column for the nametags: what should that column be called? Do we have a function that takes a Row and produces a nametag?
                          }
                          @item{ 
                              We know we need to filter so that all of our Rows are kittens: Do we have a function that takes a Row and tells us whether or not it is a kitten?
                          }
                          @item{
                              We know we need to order these rows: by what column should we order them? Ascending?
                          }
                        ]
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        Filling in these blanks, we get the following code:
                        @code[#:multi-line #t]{
                            get-kittens-tags :: (animals :: Table) -> Table
                            # get all the kittens, add nametags, and sort by name
                            fun get-kittens-tags(animals):
                                t = animals  # define the table
                                  .build-column("tags", nametags)
                                  .filter(is-kitten)
                                  .order-by("name", true)
                                ...          # produce the result
                            end
                        }
                        Fortunately, the @code{nametags} and @code{is-kitten} functions are already defined! If we found that we needed to make news ones, however, we could use the Design Recipe to do it.
                    }
                    @teacher{
                        If projecting onto a board, drawing arrows from the function names to their definitions would be really helpful here.
                    }
              }
              @point{
                  @student{
                        The final step in the Table Plan is to produce the result. For now, that result is just the table we defined, @code{t}! (Don't worry, you'll get to more complex results later)
                        @code[#:multi-line #t]{
                            get-kittens-tags :: (animals :: Table) -> Table
                            # get all the kittens, add nametags, and sort by name
                            fun get-kittens-tags(animals):
                                t = animals  # define the table
                                  .build-column("tags", nametags)
                                  .filter(is-kitten)
                                  .order-by("name", true)
                                t            # produce the result
                            end
                        }
                  }
                  @teacher{
                      Drawing arrows from the @code{t} expression on the last line back to the @code{t} definition on the first line would be a good idea here. Make sure students see the connection between "defining the table...and using it"!
                  }
              }
              @point{
                  @student{
                      Once you've typed in the Contract, Purpose and Function Definition, click "Run". How do we use this function? If you look in the @bold{Examples} section, you'll see that the Result is written underneath the expression @code{get-kittens-tags(animals-table)}. That's the code that should give us the result, so let's type it in!
                      @activity[#:forevidence (list "Data 3.1.1&1&1" "Data 3.1.1&1&2")]{
                          Type in the code and hit Enter. Did you get back the same result you expected?
                      }
                  }
                  @teacher{
                  
                  }
              }
              @point{
                    @student{
                        @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.1&1&2" "BS-DR.2&1&1" "BS-DR.1&1&2" "BS-DR.4&1&1" "BS-DR.4&1&2" "Data 3.1.1&1&1" "Data 3.1.1&1&2" "Data 3.1.1&1&4")]{
                            @itemlist[
                                @item{
                                  Turn to @worksheet-link[#:name "Dogs-by-Age"], and complete the Table Plan. When your teacher has checked your work, type in your code to create the table. @bold{Note:} this time, you'll need to fill in more missing parts of the function definition!
                                }
                                @item{
                                  Turn to @worksheet-link[#:name "Old-Dogs-Diet"], and complete the Table Plan. When your teacher has checked your work, type in your code to create the table. @bold{Note:} this time, you'll need to come up with your own Contract and Purpose!
                                }
                                @item{
                                  Turn to @worksheet-link[#:name "Fixed-Birth"], and complete the Table Plan. When your teacher has checked your work, type in your code to create the table.
                                }
                            ]
                        }
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        By now, you've had a chance to use Table Plans and Table Methods to:
                        @itemlist[
                            @item{ Extend data with computed columns }
                            @item{ Filter rows to create @italic{subsets} of data (e.g. "only cats") }
                            @item{ Order rows by a particular column, in ascending or descending order }
                        ]
                        @activity[#:forevidence (list "Data 3.1.2&1&1" "Data 3.1.2&1&2" "Data 3.1.2&1&3" "Data 3.1.2&1&4" "Data 3.1.2&1&5")]{
                            Turn to @worksheet-link[#:name "Dataset-Plans"] in your Student Workbook, and fill out questions 3-5.
                        }
                    }
                    @teacher{

                    }
              }
        ]
  }

  @lesson/studteach[
     #:title "Closing"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[@item{}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
              @point{
                    @student{
                           Congratulations! You've just learned the basics of the Pyret programming language, and how to use that language to answer a data science question. Throughout this course, you'll learn new and more powerful tools that will allow you to answer more complex questions, and in greater detail.

                     @activity[#:forevidence "BS-IDE&1&1"]{
                            Make sure to save your work.  Hit the Save button in the top left. This will save your program in the code.pyret.org folder within your Google Drive.
                  }
              }
                    @teacher{
                             If your students are working in pairs/groups, make sure that each student has access to a version of the program.  The student who saved the program to their Google Drive can share their program with anyone by hitting the Publish button in the top left, choosing "Publish a new copy", then clicking the "Share Link" option.  This will allow them to copy a link to the program, then send to their partners in an email/message.
                   }
              }
        ]
  }
}
